(function() {
    'use strict';
    angular.module('app').controller('NewScheduleCtrl', ['$rootScope', '$state', '$stateParams', '$mdToast', '$timeout', '$scope', '$mdEditDialog', '$q', '$http', '$mdDialog', 'api', NewScheduleCtrl])

    function NewScheduleCtrl($rootScope, $state, $stateParams, $mdToast, $timeout, $scope, $mdEditDialog, $q, $http, $mdDialog, api) {
        function DialogController($scope, $mdDialog, dataToPass, api) {
            $scope.passed = dataToPass;



            if (!dataToPass.data) {
                $scope.data = {};
                $scope.add = true;
                $scope.data.status = 'Unallocated';
                $scope.data.type = 0;
                $scope.data.method = 'Pickup';
                            $scope.data.loc_lat = 0;
                        $scope.data.loc_lng = 0;

            } else {
                $scope.data = dataToPass.data;
                $scope.data.type = 0;
                $scope.add = false;
                if($scope.data.allocated_emp_id)
                {
                $scope.data.emp =  $scope.data.allocated_emp_id;
                }
            }
            $scope.apipath = 'new_task/';
            $scope.temp = api.users();
            $scope.temp().then().then(function(data) {
                $scope.users = data.data;
            });
            $scope.alert = '';
            $scope.showmap = false;
            $scope.mapzoom = 12;
            $scope.datePicker = new Date()
            $scope.customers = [];
            $scope.schedule = api.schedule;
            $scope.tempcus = api.customers();
            $scope.place_type = api.place_type;
            $scope.method = api.method;
            $scope.email_rex = api.email_rex;
            $scope.web_rex = api.web_rex;
            $scope.tempcus().then().then(function(data) {
                $scope.customers = data.data;
            });
            $scope.customersChange = function() {
                var index = _.findIndex($scope.customers, function(item) {
                    return item.id == $scope.data.cust_id
                })
                var choosenCustomer = $scope.customers[index];
                if (choosenCustomer) {
                    $scope.data.cust_phone = choosenCustomer.contact_no;
                    $scope.data.cust_email = choosenCustomer.email;
                    $scope.data.cust_name = '';
                    $scope.data.cust_address = choosenCustomer.address;
                    $scope.data.loc_lat = choosenCustomer.loc_lat;
                    $scope.data.loc_lng = choosenCustomer.loc_lng;
                }
            }
            $scope.emptyCustomerInfo = function(id) {
                $scope.data.cust_phone = '';
                $scope.data.cust_email = '';
                $scope.data.cust_name = '';
                $scope.data.cust_address = '';
                $scope.data.loc_lat = 0;
                $scope.data.loc_lng = 0;
                $scope.data.cust_id = '';
            };
            $scope.geocodeupdateloc = function() {
                var address = $scope.data.cust_address;
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
            $scope.getpos = function(data, zoom = 12) {
                $scope.data.loc_lat = data.lat();
                $scope.data.loc_lng = data.lng();
                $scope.mapzoom = zoom;
                $timeout(function() {
                    $scope.$apply();
                }, 0);
            };
            $scope.submit_form = function() {
                if ($scope.data_form1.$invalid) {
                    return;
                }

                if($scope.data.loc_lat == 0 || $scope.data.loc_lng == 0 )
                {
                    $scope.alert = 'Address Lat Lang Invalid';
                          return;
                }
                console.log($scope.datePicker);
                $scope.data.schedule_date_time = $scope.datePicker;
                if ($scope.add == true) {
                    $http.post($scope.apipath, {
                        data: $scope.data
                    }).then(function(response) {
                        var res = angular.fromJson(response);
                        if (res.data.status == 'ok') {
                            $scope.alert = res.data.data;
                           // setTimeout($scope.cancel(), 2000)
                        } else {
                            $scope.alert = res.data.data;
                        }
                    }, function(response) {
                        // failure call back
                    });
                } else {
                    $http.put($scope.apipath+$scope.data.id, {
                        data: $scope.data
                    }).then(function(response) {
                        var res = angular.fromJson(response);
                        if (res.data.status == 'ok') {
                            $scope.alert = res.data.data;
                            //setTimeout($scope.cancel(), 2000)
                        } else {
                            $scope.alert = res.data.data;
                        }
                    }, function(response) {
                        // failure call back
                    });
                }
                console.log($scope.data);
            };
            $scope.hide = function() {
                $mdDialog.hide();
            };
            $scope.cancel = function() {
                $mdDialog.cancel();
            };
        }
        $scope.addRow = function() {
            $scope.multisearch.push({
                id: $scope.multisearch.length,
                column: "",
                ident: ""
            });
        };
        $scope.showTabDialog = function(ev, add, id) {
            var add = add || true;
            if (add == true) {
                var data = false;
                $mdDialog.show({
                    controller: DialogController,
                    locals: {
                        dataToPass: data
                    },
                    templateUrl: 'assets/app/new-schedule/modal_view.html?' + Math.random(),
                    targetEvent: ev,
                    clickOutsideToClose: false
                }).then(function(answer) {}, function() {});
            } else {
                $http.get('new_task/' + id).then(function(data) {
                    var data = data.data;
                    $mdDialog.show({
                        controller: DialogController,
                        locals: {
                            dataToPass: data
                        },
                        templateUrl: 'assets/app/new-schedule/modal_view.html?' + Math.random(),
                        targetEvent: ev,
                        clickOutsideToClose: false
                    }).then(function(answer) {}, function() {});
                });
            }
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
        $scope.title = 'Delivery';
        $scope.apipath = 'new_task/';
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
        });
        $scope.customers = [];
        $scope.tempcus = api.customers();
        $scope.tempcus().then().then(function(data) {
            if (data.data['0']) {
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
            name: "schedule_date_time",
            display: "Date"
        }, {
            name: "allocated_emp",
            display: "Employee"
        }, {
            name: "cust.name",
            display: "Customer"
        }, {
            name: "address",
            display: "Address"
        }, {
            name: "status",
            display: "Status"
        }];
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
    }
})();
