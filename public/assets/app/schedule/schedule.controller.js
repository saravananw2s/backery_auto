(function() {
    'use strict';
    angular.module('app').controller('ScheduleCtrl', ['$rootScope', '$state', '$stateParams', '$mdToast', '$timeout', '$scope', '$mdEditDialog', '$q', '$http', '$mdDialog', 'api', ScheduleCtrl])

    function ScheduleCtrl($rootScope, $state, $stateParams, $mdToast, $timeout, $scope, $mdEditDialog, $q, $http, $mdDialog, api) {
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
        $scope.querySearch = function(searchText) {
            return $http.get('search/' + searchText + '?type=customers').then(function(data) {
                return data.data;
            });
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
                $mdDialog.show($mdDialog.alert().title('Check Map Location').ok('OK'));
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
            $state.go('admin.scheduleview', {
                id: api.encode(id)
            });
        }
        $scope.formmode = function(type, data = 0) {
            var ev = '';
            if ($scope.data_form.$dirty && data == 0) {
                var confirm = $mdDialog.confirm().title('You will lose unsaved changes if you do this action ?').targetEvent(ev).ok('OK, Do it').cancel('Cancel');
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
        $scope.full = function() {
            $scope.load = 'Loading ...';
            $timeout(function() {
                if (typeof $scope.location.name === 'undefined') {
                    $scope.load = 'Please choose from Drop Down';
                } else {
                    console.log($scope.location);
                    $scope.clat = $scope.location.latitude, $scope.clng = $scope.location.longitude;
                    $http.get('location?type=customer&lat=' + $scope.location.latitude + '&lng=' + $scope.location.longitude).then(function(response) {
                        var res = angular.fromJson(response);
                        if (res.data.status = 'ok') {
                            $scope.positions = res.data.data
                        } else {
                            console.log(res.data.data);
                        }
                    }, function(response) {});
                    $scope.load = '';
                }
            }, 2000);
        };
        $scope.showinfo = function(event, data) {


           // $scope.addNewChoice(data);
           // $scope.data.cust_id = data;
        };
        $scope.clear = function() {
            $scope.positions = [];
        };
        $scope.title = 'Delivery Schedule';
        $scope.apipath = 'task/';
        $scope.showform = false;
        $scope.add = true;
        $scope.data = {};
        $scope.location = '';
        $scope.clat = 40.74, $scope.clng = -74.18;
        $scope.custom_map = false;
        $scope.activefilter = false;
        $scope.showsearch = false;
        var w;
        $scope.mapArray = [];




        var original;
        $scope.smart = true;
        $scope.wwstatus = true;
        $scope.datatable = {};
        $scope.datatable.data = [];
        $scope.scheduletypes = api.scheduletypes;
        $scope.data.loc_lat = 0;
        $scope.data.loc_lng = 0;
        $scope.users = [];
        $scope.data.cust_jobs = [];
        $scope.temp = api.users();
        $scope.temp().then().then(function(data) {
            $scope.users = data.data;

            angular.forEach($scope.users,(function(data,key)
            {

                $scope.users[key].full_name =data.last_name+' '+data.first_name ;

            }));
        });
        $scope.customers = [];
        $scope.tempcus = api.customers();
        $scope.tempcus().then().then(function(data) {


        if(data.data['0'])
        {
                $scope.clat = data.data['0'].loc_lat;
                 $scope.clng = data.data['0'].loc_lng;

        }


            $scope.customers = data.data;
        });


        $scope.competitorinfo = [];
        $scope.tempcompetitor = api.competitor();
        $scope.tempcompetitor().then().then(function(data) {
            $scope.competitorinfo = data.data;
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
            name: "id",
            display: "ID"
        }, {
            name: "date",
            display: "Date"
        }, {
            name: "emp_info",
            display: "Employee"
        }, ];
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
            $scope.data.cust_jobs = [];
            $scope.data.loc_lat = 0;
            $scope.data.loc_lng = 0;
            $scope.data.uploads = [];
            $scope.files = [];
            $scope.isFilesNull = true;
            $scope.mapzoom = 12;
            $scope.location = '';
            $scope.clat = 40.74, $scope.clng = -74.18;
            $scope.custom_map = false;
        };
        $scope.toggleLimitOptions = function() {
            $scope.limitOptions = $scope.limitOptions ? undefined : globalapp.pagenation;
        };
        $scope.addNewChoice = function(b = '') {
            $scope.data.cust_jobs.push({
                cust_id: b,
                type: 0,
                notes: ''

            });
        };
        $scope.removeChoice = function(data) {
            // var lastItem = $scope.cust_jobs.length - 1;
            console.log(data);
            if (data > -1) {
                $scope.data.cust_jobs.splice(data, 1);
            }
        };
        $scope.update = function() {
            $http.put($scope.apipath + $scope.data.id, {
                data: $scope.data
            }).then(function(response) {
                var res = angular.fromJson(response)
                if (res.data.status == 'ok') {
                    $scope.closeform(1);
                    $mdDialog.show($mdDialog.alert().title($scope.title + '  Info Updated').ok('OK'));
                    $scope.loaddata();
                } else {
                    $mdDialog.show($mdDialog.alert().title(res.data.data).ok('OK'));
                }
            });
        }
        $scope.uploadinit = function(func) {
            if ($scope.files.length > 0) {
                var upload = api.upload($scope.files);
                upload().then().then(function(res) {
                    var res = angular.fromJson(res);
                    if (res.status == 'ok') {
                        $scope.data.uploads = $scope.data.uploads.concat(res.data);
                        func();
                    } else {
                        $mdDialog.show($mdDialog.alert().title(res.data.data).ok('OK'));
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
            if ($scope.data.cust_jobs.length == 0) {
                $mdDialog.show($mdDialog.alert().title("No Tasks in This Schedule").ok('OK'));
                return;
            }
            if (api.checkdups($scope.data.cust_jobs, 'cust_id', 'int')) {
                $mdDialog.show($mdDialog.alert().title("Duplicate Customers not allowed").ok('OK'));
                return;
            }
            if ($scope.add == false) {
                $scope.uploadinit($scope.update);
                return;
            }
            $scope.uploadinit($scope.addinit);
        }



        $scope.addinit = function() {
            $http.post($scope.apipath, {
                data: $scope.data
            }).then(function(response) {
                var res = angular.fromJson(response);
                if (res.data.status == 'ok') {
                    $scope.closeform(1);
                    $mdDialog.show($mdDialog.alert().title('New ' + $scope.title + ' Added').ok('OK'));
                    $scope.files = [];
                    $scope.loaddata();
                } else {
                    $mdDialog.show($mdDialog.alert().title(res.data.data).ok('OK'));
                }
            }, function(response) {});
        }
        $scope.FileDelete = function(file, ev) {
            // Appending dialog to document.body to cover sidenav in docs app
            var confirm = $mdDialog.confirm().title('Are you sure to delete this  File ?').targetEvent(ev).ok('Yes, Delete').cancel('Cancel');
            $mdDialog.show(confirm).then(function() {
                $scope.data.uploads.splice(file, 1);
            }, function() {});
        }
        $scope.delete = function(dataid, ev) {
            var confirm = $mdDialog.confirm().title('Are you sure to delete this  ' + $scope.title + ' ?').targetEvent(ev).ok('Yes, Delete').cancel('Cancel');
            $mdDialog.show(confirm).then(function() {
                $http.delete($scope.apipath + dataid).then(function(response) {
                    $mdToast.show($mdToast.simple().textContent($scope.title + '  Deleted').position('top right').hideDelay(3000));
                    $scope.loaddata();
                    $scope.closeform(1);
                });
            }, function() {});
        }
        $scope.update_info = function(dataid) {
            $scope.formmode('update');
            $http.get($scope.apipath + dataid).then(function(response) {
                var res = angular.fromJson(response);
                if (res.data.status == 'ok') {
                    $scope.data = res.data.data;
                    $scope.data.uploads = angular.fromJson($scope.data.uploads);
                    $scope.data.date = new Date($scope.data.date);
                    var temp = $scope.data.cust_jobs;
                    $scope.data.cust_jobs = [];
                   // $scope.data.cust_jobs = $scope.data.cust_jobs;
                    angular.forEach(angular.fromJson(temp), function(value, key) {
                        $scope.data.cust_jobs.push({
                            cust_id: parseInt(value.cust_id),
                            id: parseInt(value.id),
                            lat: value.lat,
                            lng: value.lng,
                            type: value.type,
                            notes: value.notes,
                            remarks: value.remarks,
                            delivery_to:value.delivery_to,
                            status:value.status,
                            date:value.date,
                            timestamps:value.timestamps,
                            delivery_phone:value.delivery_phone,
                            is_cust_delivery:value.is_cust_delivery,
                            timestamp:value.timestamp,
                            remarks:value.remarks,
                            signature:value.signature
                        });
                    });

                    // $scope.$apply();
                    //$scope.data.cust_jobs.push({ cust_id: b, type: 0, notes: '' });
                    //   $scope.data.date = new Date($scope.data.date);
                } else {}
            }, function(response) {
                // failure call back
            });
        }
        $scope.loaddata = function() {
            $http.get($scope.apipath).then(function(response) {
                var res = angular.fromJson(response);
                if (res.data.status == 'ok') {
                    $scope.datatable.data = res.data.data;
                    original = res.data;
                } else {}
            }, function(response) {
                // failure call back
            });
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
                address = $scope.data.location;
            }
            if (address) {
                var geocoder = new google.maps.Geocoder();
                geocoder.geocode({
                    "address": address
                }, function(results, status) {
                    if (status == google.maps.GeocoderStatus.OK && results.length > 0) {
                        var location = results[0].geometry.location;
                        $scope.getpos(location);
                    } else {}
                });
            }
        }




$scope.$watch('data.cust_jobs', function(newVal, oldVal){


$scope.mapArray = [];

var temp = 1;
   angular.forEach( $scope.data.cust_jobs,function(key,value)
   {



    var data = _.find($scope.customers, {id: parseInt(key.cust_id)})

    if(data)
    {

        if(temp == 1)
        {
                $scope.clat = data.loc_lat;
                 $scope.clng = data.loc_lng;
                 temp = 0;

        }
        $scope.mapArray.push({

            "id" :   data.id,
            "loc_lat" :   data.loc_lat,
            "loc_lng" :   data.loc_lng,

        })

    }


}
   )







}, true);





        $scope.$on('$viewContentLoaded', function() {
            if ($stateParams.mode == 'edit' && $stateParams.data != null) {
                (function() {}, 10);
                $scope.update_info(api.decode($stateParams.data));
            } else if ($stateParams.mode == 'delete' && $stateParams.data != null) {
                $scope.delete(api.decode($stateParams.data));
            } else {}
        })
    }
})();
