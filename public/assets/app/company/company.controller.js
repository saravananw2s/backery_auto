(function() {
    'use strict';
    angular.module('app').controller('CompanyCtrl', ['$rootScope', 'localStorageService', '$state', '$stateParams', '$mdToast', '$timeout', '$scope', '$mdEditDialog', '$q', '$http', '$mdDialog', 'api', CompanyCtrl])

    function CompanyCtrl($rootScope, localStorageService, $state, $stateParams, $mdToast, $timeout, $scope, $mdEditDialog, $q, $http, $mdDialog, api) {
        $scope.activefilter = false;
        var w;
        var original;
        $scope.smart = true;
        $scope.wwstatus = true;
        $scope.datatable = {};
        $scope.datatable.data = [];
           var old = [];
        $scope.limitOptions = [5, 10, 15, 20, 25, 50, 100];
        $scope.options = {
            limitSelect: true,
            pageSelect: true,
            boundaryLinks: true
        };
        $scope.query = {
            order: 'company_name',
            limit: 10,
            page: 1
        };
        $scope.autocolumn = [{
            name: "company_name",
            display: "Name"
        }, {
            name: "company_email",
            display: "Email"
        }, {
            name: "company_phone",
            display: "Contact No"
        }, {
            name: "full_address",
            display: "Address"
        }, ];


        $scope.multisearch = Array();
        $scope.multisearch[0] = {
            id: 0,
            column: "",
            ident: "",
        };
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
            $scope.loaddata();
         
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
            $state.go('admin.companyview', {
                id: api.encode(id)
            });
        }
        $scope.formtype = function(type) {
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
        $scope.formmode = function(type, data) {
            var ev = '';
            data = data || 0;
            if ($scope.data_form.$dirty && data == 0) {
                var confirm = $mdDialog.confirm().title('You will lose unsaved changes if you do this action ?').targetEvent(ev).ok('OK, Do it').cancel('Cancel');
                $mdDialog.show(confirm).then(function() {
                    $scope.reset();
                    $scope.formtype(type);
                }, function() {});
                return 'not'
            } else {
                $scope.reset();
                $scope.formtype(type);
                return 'ok';
            }
        };
        $scope.title = 'Company';
        $scope.apipath = 'company/';
        $scope.showform = false;
        $scope.add = true;
        $scope.data = {};
        $scope.showsearch = false;
        var xdomain = api.rootdomain;
        $scope.email_rex = api.email_rex;
        $scope.web_rex = api.web_rex;
        $scope.data.loc_lat = 0;
        $scope.data.loc_lng = 0;
        $scope.users = [];
        $scope.temp = api.users();
        $scope.temp().then().then(function(data) {
            $scope.users = data.data;
        });
        $scope.mapzoom = 12;
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
            $scope.cust_jobs.push({
                cust_id: b,
                type: 0,
                notes: ''
            });
        };
        $scope.removeChoice = function(data) {
            if (data > -1) {
                $scope.cust_jobs.splice(data, 1);
            }
        };
        $scope.update = function() {
            $http.put($scope.apipath + $scope.data.company_id, {
                data: $scope.data
            }, {
                headers: {
                    'x-sub-root-domain': xdomain
                }
            }).then(function(response) {
                var res = angular.fromJson(response)
                console.log(res.data);
                if (res.data.status == 'ok') {
                    $scope.closeform(1);
                    $mdDialog.show($mdDialog.alert().title($scope.title + '  Info Updated').ok('OK'));
                    localStorageService.set('update', 'yes');
                    $scope.loaddata();
                } else {
                    $mdDialog.show($mdDialog.alert().title(res.data.data).ok('OK'));
                }
            });
        }
        $scope.add_data = function() {



            if ($scope.data_form.$invalid) {
                return;
            }

             var upload = api.upload($scope.files, 'img');
                if ($scope.files.length == 1) {
                    upload().then().then(function(res) {
                        var res = angular.fromJson(res);
                        if (res.status == 'ok') {
                            old = $scope.data.logo;


                            $scope.data.logo = res.data;
                          

                                 if ($scope.add == false) {
                $scope.update();
                return;
            }

            $scope.addinit();



                        } else {
                            $mdDialog.show($mdDialog.alert().title(res.data).ok('OK'));
                        }
                    });
                } else {


                           if ($scope.add == false) {
                $scope.update();
                return;
            }

            $scope.addinit();


                   
                }



     




        }


        $scope.addinit = function()
        {


            $http.post($scope.apipath, {
                data: $scope.data
            }, {
                headers: {
                    'x-sub-root-domain': xdomain
                }
            }).then(function(response) {
                var res = angular.fromJson(response);
                console.log(res.data);
                if (res.data.status == 'ok') {
                    $scope.closeform(1);
                    $mdDialog.show($mdDialog.alert().title('New ' + $scope.title + ' Added').ok('OK'));
                    localStorageService.set('update', 'yes');
                    $scope.loaddata();
                } else {
                    $mdDialog.show($mdDialog.alert().title(res.data.data).ok('OK'));
                }
            }, function(response) {});

        }
        $scope.delete = function(dataid,back, ev) {
            back = back || 0;

            var confirm = $mdDialog.confirm().title('Are you sure to delete this  ' + $scope.title + ' ?').targetEvent(ev).ok('Yes, Delete').cancel('Cancel');
            $mdDialog.show(confirm).then(function() {
                $http.delete($scope.apipath + dataid, {
                    headers: {
                        'x-sub-root-domain': xdomain
                    }
                }).then(function(response) {

                    $scope.closeform(1);
                    $mdToast.show($mdToast.simple().textContent($scope.title + ' Deleted').position('top right').hideDelay(3000));
                    localStorageService.set('update', 'yes');
                    $scope.loaddata();
                });
            }, function() {

                if(back == 1)
                {
                      $scope.view(dataid)

                }

               
            });
        }
        $scope.update_info = function(dataid) {
            var ev = '';
            if ($scope.data_form.$dirty) {
                var confirm = $mdDialog.confirm().title('You will lose unsaved changes if you do this action ?').targetEvent(ev).ok('OK, Do it').cancel('Cancel');
                $mdDialog.show(confirm).then(function() {
                    $http.get($scope.apipath + dataid, {
                        headers: {
                            'x-sub-root-domain': xdomain
                        }
                    }).then(function(response) {
                        var res = angular.fromJson(response);
                        if (res.data.status == 'ok') {
                            $scope.data = res.data.data;
                            $scope.showform = true;
                            $scope.add = false;
                            $scope.data_form.$dirty = false;
                        } else {}
                    }, function(response) {
                        // failure call back
                    });
                }, function() {});
            } else {
                $http.get($scope.apipath + dataid, {
                    headers: {
                        'x-sub-root-domain': xdomain
                    }
                }).then(function(response) {
                    var res = angular.fromJson(response);
                    if (res.data.status == 'ok') {
                        $scope.showform = true;
                        $scope.add = false;
                        $scope.data = res.data.data;

                        $scope.data_form.$dirty = false;
                    } else {}
                }, function(response) {
                    // failure call back
                });
            }
        }
        $scope.loaddata = function() {

            console.log('loading');

            
            $http.get($scope.apipath, {
                headers: {
                    'x-sub-root-domain': xdomain
                }
            }).then(function(response) {
                var res = angular.fromJson(response);

                console.log(response)
                if (res.data.status == 'ok') {


                console.log($scope)

               $scope.datatable.data = res.data.data;
                    original = res.data;

                } else {}
            }, function(response) {
                // failure call back
            });
        }


        $scope.loaddata();


        $scope.FileDelete = function(file, ev) {
                // Appending dialog to document.body to cover sidenav in docs app
                var confirm = $mdDialog.confirm().title('Are you sure to delete this  File ?').targetEvent(ev).ok('Yes, Delete').cancel('Cancel');
                $mdDialog.show(confirm).then(function() {
                    $scope.data.logo.splice(file, 1);
                }, function() {});
            }




        $scope.$on('$viewContentLoaded', function() {
            if ($stateParams.mode == 'edit' && $stateParams.data != null) {
                (function() {}, 10);
                $scope.update_info(api.decode($stateParams.data));
            } else if ($stateParams.mode == 'delete' && $stateParams.data != null) {
                $scope.delete(api.decode($stateParams.data),1);
            } else {}
        })
    }
})();