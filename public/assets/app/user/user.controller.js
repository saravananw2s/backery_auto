(function() {
        'use strict';
        angular.module('app').controller('UserCtrl', ['$rootScope', '$state', '$stateParams', '$mdToast', '$timeout', '$scope', '$mdEditDialog', '$q', '$http', '$mdDialog', 'api', UserCtrl])

        function UserCtrl($rootScope, $state, $stateParams, $mdToast, $timeout, $scope, $mdEditDialog, $q, $http, $mdDialog, api) {
            $scope.resetpwd = function(user_id, ev) {
                $mdDialog.show({
                    locals: {
                        dataToPass: user_id
                    },
                    controller: ResetPasswordController,
                    templateUrl: 'assets/app/popup/reset.html',
                    parent: angular.element(document.body),
                    targetEvent: ev,
                    clickOutsideToClose: false
                }).then(function(answer) {}, function() {});
            };







            function ResetPasswordController($scope, $mdDialog, $http, dataToPass) {
                $scope.user_id = dataToPass;
                $scope.password = '';
                $scope.chpwd = '';
                $scope.close = function() {
                    $mdDialog.hide();
                };
                $scope.resetpwd = function() {
                    if ($scope.reset.$invalid) {
                        return;
                    }
                    $http.post('adminresetpassword', {
                        data: {
                            'new_password': $scope.password,
                            'confirm_password': $scope.chpwd,
                            'user_id': $scope.user_id
                        }
                    }).then(function(response) {
                        var res = angular.fromJson(response);
                        if (res.data.status == 'ok') {
                            $mdDialog.show($mdDialog.alert().title('Password reset successfully').ok('OK'));
                            $mdDialog.hide();
                        } else {
                            $mdDialog.show($mdDialog.alert().title(res.data.data).ok('OK'));
                        }
                    }, function(response) {});
                };
            }
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
                $state.go('admin.userview', {
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
            $scope.title = 'Employee';
            $scope.apipath = 'user/';
            $scope.showform = false;
            $scope.add = true;
            $scope.data = {};
            $scope.activefilter = false;
            $scope.active = api.active;
            $scope.gps_active = api.gps_active;
            $scope.showsearch = false;
            $scope.is_manager = api.manager();
            $scope.salesman_id = api.sales_man_role_id;
            var w;
            var original;
            var old = [];
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
            $scope.roles = [];
            $scope.temproles = api.roles();
            $scope.temproles().then().then(function(data) {
                $scope.roles = data.data;
            });
            $scope.managers = [];
            $scope.managersUpdate = function() {
                $scope.tempmanagers = api.managers();
                $scope.tempmanagers().then().then(function(data) {
                    $scope.managers = data.data;
                });
            }
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
                name: "user_id",
                display: "EMP Id"
            }, {
                name: "last_name",
                display: "Last Name"
            }, {
                name: "first_name",
                display: "First Name"
            }, {
                name: "email",
                display: "Email"
            }, {
                name: "phone",
                display: "Contact No"
            },


            // {
            //     name: "role",
            //     display: "Role"
            // },



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
                if ($scope.is_manager) {
                    $scope.data.role_id = 1;
                }
                $scope.data.loc_lat = 0;
                $scope.data.loc_lng = 0;

                $scope.data.profile_image = [];
                $scope.files = [];
                $scope.isFilesNull = true;
                $scope.mapzoom = 12;
                old = [];
            };
            $scope.toggleLimitOptions = function() {
                $scope.limitOptions = $scope.limitOptions ? undefined : globalapp.pagenation;
            };
            $scope.update = function() {
                if ($scope.files.length == 1) {
                    var upload = api.upload($scope.files, 'img');
                    upload().then().then(function(res) {
                        var res = angular.fromJson(res);
                        if (res.status == 'ok') {
                            old = $scope.data.profile_image;
                            $scope.data.profile_image = res.data;
                            $scope.initput();
                        } else {
                            $mdDialog.show($mdDialog.alert().title(res.data).ok('OK'));
                        }
                    });
                } else {
                    $scope.initput();
                }
            }
            $scope.add_data = function() {
                if ($scope.data_form.$invalid) {
                    return;
                }
                if ($scope.add == false) {
                    $scope.update();
                    return;
                }
                var upload = api.upload($scope.files, 'img');
                if ($scope.files.length == 1) {
                    upload().then().then(function(res) {
                        var res = angular.fromJson(res);
                        if (res.status == 'ok') {
                            old = $scope.data.profile_image;
                            $scope.data.profile_image = res.data;
                            $scope.initpost();
                        } else {
                            $mdDialog.show($mdDialog.alert().title(res.data).ok('OK'));
                        }
                    });
                } else {
                    $scope.initpost();
                }
            }
            $scope.initput = function() {
                $http.put($scope.apipath + $scope.data.user_id, {
                    data: $scope.data
                }).then(function(response) {
                    var res = angular.fromJson(response)
                    if (res.data.status == 'ok') {
                        $scope.closeform(1);
                        $mdDialog.show($mdDialog.alert().title($scope.title + '  Info Updated').ok('OK'));
                        $scope.loaddata();
                    } else {
                        $mdDialog.show($mdDialog.alert().title(res.data.data).ok('OK'));
                        $scope.data.profile_image = old;
                    }
                });
            }
            $scope.initpost = function() {
                $http.post($scope.apipath, {
                    data: $scope.data
                }).then(function(response) {
                    var res = angular.fromJson(response);
                    if (res.data.status == 'ok') {
                        $scope.closeform(1);
                        $mdDialog.show($mdDialog.alert().title('New ' + $scope.title + ' Added').ok('OK'));
                        $scope.files = [];
                        $scope.loaddata();
                        $scope.data.profile_image = angular.fromJson($scope.data.profile_image);
                    } else {
                        $scope.data.profile_image = old;
                        $mdDialog.show($mdDialog.alert().title(res.data.data).ok('OK'));
                    }
                }, function(response) {});
            }
            $scope.FileDelete = function(file, ev) {
                // Appending dialog to document.body to cover sidenav in docs app
                var confirm = $mdDialog.confirm().title('Are you sure to delete this  File ?').targetEvent(ev).ok('Yes, Delete').cancel('Cancel');
                $mdDialog.show(confirm).then(function() {
                    $scope.data.profile_image.splice(file, 1);
                }, function() {});
            }
            $scope.delete = function(dataid, ev) {
                var confirm = $mdDialog.confirm().title('Are you sure to delete this  ' + $scope.title + ' ?').targetEvent(ev).ok('Yes, Delete').cancel('Cancel');
                $mdDialog.show(confirm).then(function() {
                    $http.delete($scope.apipath + dataid).then(function(response) {

                       if(angular.fromJson(response).data.status == 'ok')
                       {
                        $mdToast.show($mdToast.simple().textContent($scope.title + ' Deleted').position('top right').hideDelay(3000));
                        $scope.loaddata();
                        $scope.closeform(1)
                       }
                       else
                       {
   $mdToast.show(
      $mdToast.simple()
        .textContent(response.data.data)
        .position('top right')
        .hideDelay(3000)
    );




                       }

                    });
                }, function() {});
            }
            $scope.update_info = function(dataid) {
                var ev = '';
                if ($scope.data_form.$dirty) {
                    var confirm = $mdDialog.confirm().title('You will lose unsaved changes if you do this action ?').targetEvent(ev).ok('OK, Do it').cancel('Cancel');
                    $mdDialog.show(confirm).then(function() {

                            $http.get($scope.apipath + dataid).then(function(response) {
                                var res = angular.fromJson(response);
                                if (res.data.status == 'ok') {
                                    $scope.showform = true;
                                    $scope.add = false;
                                    $scope.data = res.data.data;
                                    $scope.data_form.$dirty = false;
                                    $scope.data = res.data.data;
                                    $scope.data.profile_image = angular.fromJson($scope.data.profile_image);
                                }
                            }, function(response) {

                            });



                        }, function() {});

                        }
                        else {
                            $http.get($scope.apipath + dataid).then(function(response) {
                                var res = angular.fromJson(response);
                                if (res.data.status == 'ok') {
                                    $scope.showform = true;
                                    $scope.add = false;
                                    $scope.data = res.data.data;
                                    $scope.data_form.$dirty = false;
                                    $scope.data = res.data.data;
                                    $scope.data.profile_image = angular.fromJson($scope.data.profile_image);
                                } else {}
                            }, function(response) {
                                // failure call back
                            });
                        }
                    }


                    $scope.loaddata = function() {
                        $scope.managersUpdate();
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
