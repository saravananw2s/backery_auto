(function() {
    'use strict';



    angular.module('app')
        .controller('AttandanceCtrl', ['$rootScope', '$state', '$stateParams','$mdToast', '$timeout', '$scope', '$mdEditDialog', '$q', '$http', '$mdDialog', 'api', AttandanceCtrl])


    function AttandanceCtrl($rootScope, $state, $stateParams, $mdToast, $timeout, $scope, $mdEditDialog, $q, $http, $mdDialog, api) {



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

            $state.go('admin.attandanceview', { id: api.encode(id) });
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


        $scope.title = 'Attendance';
        $scope.apipath = api.base +'attendance/';
        $scope.showform = false;
        $scope.add = true;
        $scope.data = {};

          $scope.attendance_type = api.attendance_type;
        $scope.activity = [];
        $scope.activitytemp  = api.activity();
         $scope.activitytemp().then().then(function(data) {
            $scope.activity = data.data;
        });
        $scope.activefilter = false;
        $scope.showsearch = false;
        $scope.visit_types = api.visit_types;
        var w;

        var original;
        $scope.smart = true;
        $scope.wwstatus = true;

        $scope.datatable = {};
        $scope.datatable.data = [];

        $scope.data.loc_lat = 0;
        $scope.data.loc_lng = 0;
        $scope.users = [];
        $scope.data.hotel_exp = [];
        $scope.data.travel_exp = [];
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





        $scope.autocolumn = [

             {
                name: "id",
                display: "Report ID"
            }, 

            {
                name: "in_time",
                display: "Log in "
            }, {
                name: "out_time",
                display: "Log Out"
            },

            {
                name: "attent_type",
                display: "Status"
            },

            {
                name: "user_id",
                display: "Employee"
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
                $scope.data.hotel_exp = [];
        $scope.data.travel_exp = [];
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

        $scope.update = function() {


                $http.put($scope.apipath + $scope.data.id, { data: $scope.data })
                    .then(
                        function(response) {

                              var res = angular.fromJson(response) 
                             
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


        }


  $scope.uploadinit = function(func) {

            if ($scope.files.length > 0) {
                var upload = api.upload($scope.files);

                upload().then().then(function(res) {

                    var res = angular.fromJson(res);



                if (res.status == 'ok') {

                    $scope.data.uploads = $scope.data.uploads.concat(res.data);
                     
                     func();
                }
                else
                {
                        $mdDialog.show(
                                    $mdDialog.alert()
                                    .title(res.data.data).ok('OK')
                                );

                }



                });
            } else {
              func();
            }

        }

        $scope.add_data = function() {

            if ($scope.data_form.$invalid) {

                return;
            }
            if ($scope.add == false) {

                $scope.uploadinit($scope.update); 

                return;
            }

            $scope.uploadinit($scope.addinit);

     
        }

        $scope.addinit = function()
        {
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


            if ($scope.data.location && $scope.data.location != undefined) {

                address =  $scope.data.location;



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
