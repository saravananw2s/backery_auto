(function() {
    'use strict';



    angular.module('app')
        .controller('DevCtrl', ['$rootScope', '$state', '$stateParams','$mdToast', '$timeout', '$scope', '$mdEditDialog', '$q', '$http', '$mdDialog', 'api','$compile', 'uiCalendarConfig', DevCtrl])


    function DevCtrl($rootScope, $state, $stateParams, $mdToast, $timeout, $scope, $mdEditDialog, $q, $http, $mdDialog, api,$compile, uiCalendarConfig) {


// $scope.gps = {
//     lat: 54.58545,
//     lng: 54.58545,
//     accuracy: 54.58545,
//     speed: 54.58545,
//     bearing: 54.58545,
//     activity: 54.58545,
//     timestamp: new Date(),

// };



//   $http.post('locationapi', { data: $scope.gps })
//                     .then(
//                         function(response) {

//                             console.log(response)
//                         }
//                         );




//         var date = new Date();
//         var d = date.getDate();
//         var m = date.getMonth();
//         var y = date.getFullYear();
        
 //        $http.get('/getMeeting/').success(function(data) {
            
 //     user.events = [];

 //     angular.forEach(data, function(value, key) {



 //         user.events.push({
 //             title: user.getMeeting[key].fields.description,
 //             start: new Date(user.getMeeting[key].fields.time)
 //         });


 //     }, log);


 //     console.log(user.events);
 // });

 //  console.log(user.events);

        /* event source that contains custom events on the scope */
        $scope.events = [
            {title: 'All Day Event',start: new Date(y, m, 1)},
            {title: 'Long Event',start: new Date(y, m, d - 5),end: new Date(y, m, d - 2)},
            {title: 'Go Hiking',start: new Date(y, m, d - 1), className: ['fc-event-warning']},
            {id: 999,title: 'Repeating Event',start: new Date(y, m, d - 3, 16, 0),allDay: false, className: ['fc-event-success']},
            {id: 999,title: 'Repeating Event',start: new Date(y, m, d + 4, 16, 0),allDay: false, className: ['fc-event-success']},
            {title: 'Birthday Party',start: new Date(y, m, d + 1, 11, 0),end: new Date(y, m, d + 1, 12, 30),allDay: false, className: ['fc-event-danger']},
            {title: 'Shopping',start: new Date(y, m, d + 2, 9, 0),end: new Date(y, m, d + 2, 12, 0),allDay: false, className: ['fc-event-success']},
            {title: 'Click for Google',start: new Date(y, m, 28),end: new Date(y, m, 29),url: 'http://google.com/'},
            {title: 'Shopping',start: new Date(y, m + 1, 8)},
        ];
        /* event source that calls a function on every view switch */
        $scope.eventsF = function (start, end, timezone, callback) {
            var s = new Date(start).getTime() / 1000;
            var e = new Date(end).getTime() / 1000;
            var m = new Date(start).getMonth();
            var events = [{title: 'Feed Me ' + m,start: s + (50000),end: s + (100000),allDay: false, className: ['customFeed']}];
            callback(events);
        };

        $scope.calEventsExt = {
             color: '#f00',
             textColor: 'yellow',
             events: [ 
                    {type:'party',title: 'Lunch',start: new Date(y, m, d, 12, 0),end: new Date(y, m, d, 14, 0),allDay: false},
                    {type:'party',title: 'Lunch 2',start: new Date(y, m, d, 12, 0),end: new Date(y, m, d, 14, 0),allDay: false},
                    {type:'party',title: 'Click for Google',start: new Date(y, m, 28),end: new Date(y, m, 29),url: 'http://google.com/'}
                ]
        };
        /* alert on eventClick */
        $scope.alertOnEventClick = function( event, allDay, jsEvent, view ){
                $scope.alertMessage = (event.title + ' was clicked ');
        };
        /* alert on Drop */
         $scope.alertOnDrop = function( event, revertFunc, jsEvent, ui, view){
             $scope.alertMessage = ('Event Droped on ' + event.start.format());
        };
        /* alert on Resize */
        $scope.alertOnResize = function( event, jsEvent, ui, view){
             $scope.alertMessage = ('Event end date was moved to ' + event.end.format());
        };
        /* add and removes an event source of choice */
        $scope.addRemoveEventSource = function(sources,source) {
            var canAdd = 0;
            angular.forEach(sources,function(value, key){
                if(sources[key] === source){
                    sources.splice(key,1);
                    canAdd = 1;
                }
            });
            if(canAdd === 0){
                sources.push(source);
            }
        };
        /* add custom event*/
        $scope.addEvent = function() {
            $scope.events.push({
                title: 'New Event',
                start: new Date(y, m, d),
                end: new Date(y, m, d + 1)
            });
        };
        /* remove event */
        $scope.remove = function(index) {
            $scope.events.splice(index,1);
        };
        /* Change View */
        $scope.changeView = function(view, calendar) {
            uiCalendarConfig.calendars[calendar].fullCalendar('changeView',view);
        };
        /* Change View */
        $scope.renderCalender = function(calendar) {
            if(calendar){
                calendar.fullCalendar('render');
            }
        };
        /* config object */
        $scope.uiConfig = {
            calendar:{
                height: 450,
                editable: true,
                header:{
                    left: 'title',
                    center: '',
                    right: 'today prev,next'
                },
                eventClick: $scope.alertOnEventClick,
                eventDrop: $scope.alertOnDrop,
                eventResize: $scope.alertOnResize
            }
        };




        /* event sources array*/
        $scope.eventSources = [ $scope.events, $scope.eventsF];








        /* SFA Group */
        $scope.addRow = function() {
            $scope.multisearch.push({
                id: $scope.multisearch.length,
                column: "",
                ident: ""
            });
        };
        $scope.deleteRow = function(int) {
            $scope.multisearch.splice(int, 1);
            for (var i = 0; i < $scope.multisearch.length; i++) {
                $scope.multisearch[i].id = i;
            }
            $scope.updateDataTable();
        };


        $scope.resettable = function() {
            $scope.wwstatus = true;
            $scope.datatable = angular.copy(original);
        };
        $scope.updateDataTable = function() {
            $scope.wwstatus = false;
            var filter = false; //set filter false
            for (var j = 0; j < $scope.multisearch.length; j++) {
                if ($scope.multisearch[j].ident && $scope.multisearch[j].column) {
                    filter = true; //if a filter exists

                }
            }
            if (filter) { //if a filter is set
                if (w) {
                    w.terminate();
                }
                w = new Worker("assets/app/core/filter.js");
                w.postMessage({
                    multisearch: $scope.multisearch,
                    datatable: angular.copy(original), //copy the original,
                    smart: $scope.smart
                });
                w.onmessage = function(event) {
                    $scope.datatable = event.data;
                    $scope.wwstatus = true;
                    $scope.$digest();
                };
            } else {
                $scope.wwstatus = true;
                $scope.datatable = angular.copy(original);
            }
        }


        $scope.checkloc = function() {
            if (!$scope.data.loc_lat && !$scope.data.loc_lng) {

                $mdDialog.show(
                    $mdDialog.alert()
                    .title('Check Map Location').ok('OK')
                );

                return true;
            }
        }


        $scope.closeform = function(data) {

                data = data || 0;
                
            $scope.formmode('close', data);

        }

        $scope.addbtn = function() {
            $scope.formmode('add');

        }

        $scope.submit_form = function() {

            $scope.data_form.$setSubmitted();
            $scope.add_data();
        }


        $scope.view = function(id) {

            $state.go('admin.devview', { id: api.encode(id) });
        }


        $scope.formmode = function(type, data = 0) {


            var ev = '';



            if ($scope.data_form.$dirty && data == 0) {

                var confirm = $mdDialog.confirm()
                    .title('You will lose unsaved changes if you do this action ?')
                    .targetEvent(ev)
                    .ok('OK, Do it')
                    .cancel('Cancel');
                $mdDialog.show(confirm).then(function() {


                    $scope.reset();

                    if (type === 'update') {

                        $scope.showform = true;
                        $scope.add = false;
                    } else if (type === 'add') {

                        $scope.showform = true;
                        $scope.add = true;
                    } else {

                        $scope.showform = false;
                        $scope.add = true;
                    }


                    return;

                }, function() {

                    return;

                });

            } else {
                $scope.reset();

                if (type === 'update') {

                    $scope.showform = true;
                    $scope.add = false;
                } else if (type === 'add') {

                    $scope.showform = true;
                    $scope.add = true;
                } else {

                    $scope.showform = false;
                    $scope.add = true;
                }
            }





        };


        $scope.title = 'Developer Mode ';
        $scope.apipath = '/customer/';
        $scope.showform = false;
        $scope.add = true;
        $scope.data = {};
        $scope.activefilter = false;
        $scope.showsearch = false;
        var w;

        var original;
        $scope.smart = true;
        $scope.wwstatus = true;

        $scope.datatable = {};
        $scope.datatable.data = [];

        $scope.data.loc_lat = 0;
        $scope.data.loc_lng = 0;
        $scope.users = [];
        $scope.temp = api.users();
        $scope.temp().then().then(function(data) {
            $scope.users = data.data;
        });
        $scope.mapzoom = 12;
        $scope.limitOptions = [5, 10, 15, 20, 25, 50, 100];
        $scope.options = {
            limitSelect: true,
            pageSelect: true,
            boundaryLinks: true
        };
        $scope.query = {
            order: 'name',
            limit: 10,
            page: 1
        };

        $scope.autocolumn = [{
                name: "name",
                display: "Name"
            }, {
                name: "email",
                display: "Email"
            },

            {
                name: "contact_no",
                display: "Contact No"
            },

            {
                name: "contact_person",
                display: "Contact Person"
            },

        ];

        $scope.multisearch = Array();
        $scope.multisearch[0] = {
            id: 0,
            column: "",
            ident: "",
        };


        $scope.reset = function() {


            if ($scope.lfApi) {
                $scope.lfApi.removeAll()
            }
            $scope.data_form.$setPristine();
            $scope.data_form.$setUntouched();
            $scope.data = {};
            $scope.data.loc_lat = 0;
            $scope.data.loc_lng = 0;
            $scope.data.uploads = [];
            $scope.files = [];
            $scope.isFilesNull = true;
            $scope.mapzoom = 12;


        };




        $scope.toggleLimitOptions = function() {
            $scope.limitOptions = $scope.limitOptions ? undefined : globalapp.pagenation;
        };

        $scope.addNewChoice = function(b = '') {

            var newItemNo = $scope.cust_jobs.length + 1;

            $scope.cust_jobs.push({ cust_id: b, type: 0, notes: '' });

        };

        $scope.removeChoice = function(data) {

            if (data > -1) {
                $scope.cust_jobs.splice(data, 1);
            }

        };




        $scope.update = function() {


            var upload = api.upload($scope.files);

            upload().then().then(function(res) {


                $scope.data.uploads = $scope.data.uploads.concat(res.data);


                $http.put($scope.apipath + $scope.data.id, { data: $scope.data })
                    .then(
                        function(response) {

                              var res = angular.fromJson(response) 
                               console.log(res.data);

                            if (res.data.status == 'ok') {

                                $scope.closeform(1);



                                $mdDialog.show(
                                    $mdDialog.alert()
                                    .title($scope.title + '  Info Updated').ok('OK')
                                );

        

                                $scope.loaddata();


                            } else {

                                $mdDialog.show(
                                    $mdDialog.alert()
                                    .title(res.data.data).ok('OK')
                                );


                            }
                        }

                    );

                $scope.files = [];



            });



        }




        $scope.add_data = function() {

            if ($scope.data_form.$invalid) {

                return;
            }
            if ($scope.add == false) {

                $scope.update();

                return;
            }

            var upload = api.upload($scope.files);

            upload().then().then(function(res) {

                $scope.data.uploads = res.data;

                $http.post($scope.apipath, { data: $scope.data })
                    .then(
                        function(response) {

                            var res = angular.fromJson(response);


                            if (res.data.status == 'ok') {

                                $scope.closeform(1);



                                $mdDialog.show(
                                    $mdDialog.alert()
                                    .title('New ' + $scope.title + ' Added').ok('OK')
                                );

                                $scope.files = [];

                                $scope.loaddata();


                            } else {

                                $mdDialog.show(
                                    $mdDialog.alert()
                                    .title(res.data.data).ok('OK')
                                );


                            }


                        },
                        function(response) {

                        }
                    );



            });


        }



        $scope.FileDelete = function(file, ev) {
            // Appending dialog to document.body to cover sidenav in docs app
            var confirm = $mdDialog.confirm()
                .title('Are you sure to delete this  File ?')
                .targetEvent(ev)
                .ok('Yes, Delete')
                .cancel('Cancel');
            $mdDialog.show(confirm).then(function() {

                $scope.data.uploads.splice(file, 1);

            }, function() {});

        }





        $scope.delete = function(dataid, ev) {


            var confirm = $mdDialog.confirm()
                .title('Are you sure to delete this  ' + $scope.title + ' ?')
                .targetEvent(ev)
                .ok('Yes, Delete')
                .cancel('Cancel');
            $mdDialog.show(confirm).then(function() {


                $http.delete($scope.apipath + dataid)
                    .then(
                        function(response) {

                            $mdToast.show(
      $mdToast.simple()
        .textContent($scope.title + '  Deleted')
        .position('top right')
        .hideDelay(3000)
    );
                            $scope.loaddata();
                        });


            }, function() {});




        }




        $scope.update_info = function(dataid) {


            $scope.formmode('update');

            $http.get($scope.apipath + dataid)
                .then(
                    function(response) {

                        var res = angular.fromJson(response);



                        if (res.data.status == 'ok') {


                            $scope.data = res.data.data;


                            $scope.data.uploads = angular.fromJson($scope.data.uploads);


                        } else {


                        }
                    },
                    function(response) {
                        // failure call back
                    }
                );



        }





        $scope.loaddata = function() {
            $http.get($scope.apipath)
                .then(
                    function(response) {

                        var res = angular.fromJson(response);

                        if (res.data.status == 'ok') {


                            $scope.datatable.data = res.data.data;
                            original = res.data;



                        } else {


                        }
                    },
                    function(response) {
                        // failure call back
                    }
                );
        }

        $scope.loaddata();




        $scope.getpos = function(data, zoom = 12) {

            $scope.data.loc_lat = data.lat();
            $scope.data.loc_lng = data.lng();
            $scope.mapzoom = zoom;

            $timeout(function() {

                $scope.$apply();
            }, 0);

        };



        $scope.geocodeupdateloc = function() {

            var address = '';


            if ($scope.data.address && $scope.data.address != undefined) {

                address = address + $scope.data.address;



            }

            if ($scope.data.district && $scope.data.district != undefined) {




                address = address + ',' + $scope.data.district;
            }

            if ($scope.data.city && $scope.data.city != undefined) {
                address = address + ',' + $scope.data.city;
            }



            if ($scope.data.state && $scope.data.state != undefined) {
                address = address + ',' + $scope.data.state;
            }



            if ($scope.data.country && $scope.data.country != undefined) {
                address = address + ',' + $scope.data.country;
            }



            if ($scope.data.zipcode && $scope.data.zipcode != undefined) {
                address = address + ',' + $scope.data.zipcode;
            }





            if (address) {




                var geocoder = new google.maps.Geocoder();

                geocoder.geocode({ "address": address }, function(results, status) {




                    if (status == google.maps.GeocoderStatus.OK && results.length > 0) {

                        var location = results[0].geometry.location;

                        $scope.getpos(location);


                    } else {

                    }

                });
            }

        }

        $scope.$on('$viewContentLoaded', function() {

            if ($stateParams.mode == 'edit' && $stateParams.data != null) {
                (function() {}, 10);
                $scope.update_info(api.decode($stateParams.data));
            } else if ($stateParams.mode == 'delete' && $stateParams.data != null) {
                $scope.delete(api.decode($stateParams.data));
            } else {

            }

        })



    }
})();
