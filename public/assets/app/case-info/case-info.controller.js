


(function() {
    'use strict';
    angular.module('app').controller('CaseInfoCtrl', ['_', '$rootScope', '$state', '$stateParams', '$mdToast', '$timeout', '$scope', '$mdEditDialog', '$q', '$http', '$mdDialog', 'api', CaseInfoCtrl])

    function CaseInfoCtrl(_, $rootScope, $state, $stateParams, $mdToast, $timeout, $scope, $mdEditDialog, $q, $http, $mdDialog, api) {
        $scope.addRow = function() {
            $scope.multisearch.push({
                id: $scope.multisearch.length,
                column: "",
                ident: ""
            });
        };


    


  $scope.showTabDialog = function(uploads,index,ev) {

    var data = {};
    data.index = index;
    data.uploads = uploads;

    $mdDialog.show({
       locals:{dataToPass: data},
      controller: ['$rootScope', '$sce', '$stateParams', '$state', '$timeout', '$scope', '$mdEditDialog', '$q', '$http', '$mdDialog', 'api','dataToPass', CaseFileCtrl],
      templateUrl: 'assets/app/case-info/case.fileupload.html',
      parent: angular.element(document.body),
      targetEvent: ev,
    multiple:true,
      clickOutsideToClose:false,
       escapeToClose: false
    })
        .then(function(temp) {


         $scope.data.cases_info_detail[temp.index].uploads = temp.uploads

        }, function() {
 
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
            $state.go('admin.caseinfoview', {
                id: api.encode(id)
            });
        }

        $scope.formmode = function(type, data) {

            data = data || 0;
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
        $scope.title = 'Case';
        $scope.apipath = 'caseinfo/';
        $scope.showform = false;
        $scope.add = true;
        $scope.data = {};
        $scope.case_status = api.case_status;
        $scope.activefilter = false;
        $scope.showsearch = false;
        var w;
        $scope.product = [];
        $scope.tempproduct = api.product();
        $scope.tempproduct().then().then(function(data) {
            $scope.product = data.data;
        });
        var original;
        $scope.smart = true;
        $scope.wwstatus = true;
        $scope.datatable = {};
        $scope.datatable.data = [];
        $scope.data.loc_lat = 0;
        $scope.data.loc_lng = 0;
        $scope.users = [];
        $scope.case_types = api.case_types;
        $scope.data.cases_info_detail = [];
        $scope.temp = api.users();
        $scope.temp().then().then(function(data) {
            $scope.users = data.data;
        });
        $scope.customers = [];
        $scope.tempcus = api.customers();
        $scope.tempcus().then().then(function(data) {
            $scope.customers = data.data;
        });
        $scope.product = [];
        $scope.tempproduct = api.product()
        $scope.tempproduct().then().then(function(data) {
            $scope.product = data.data;
             console.log($scope.product);
        })
        $scope.temporders_data = api.orders_data();
        $scope.temporders_data().then().then(function(data) {
            $scope.orders_data = data.data;
        });
        $scope.competitorinfo = [];
        $scope.tempcompetitor = api.competitor();
        $scope.tempcompetitor().then().then(function(data) {
            $scope.competitorinfo = data.data;
        });
        $scope.orders_data = [];
        $scope.temporders_data = api.orders_data();
        $scope.temporders_data().then().then(function(data) {
            $scope.orders_data = data.data;
           
        });
        $scope.is_manager = api.manager();
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
            name: "case_id",
            display: "Case Id"
        }, {
            name: "cust_id",
            display: "Customer"
        }, {
            name: "open_dt",
            display: "Open Date"
        }, {
            name: "status",
            display: "Status"
        }, {
            name: "taken_by",
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
            $scope.data.cases_info_detail = [];
            $scope.data.loc_lat = 0;
            $scope.data.loc_lng = 0;
            $scope.data.uploads = [];
            $scope.files = [];
            $scope.isFilesNull = true;
            $scope.mapzoom = 12;
        };
        $scope.addNewChoice = function(b) {
            b = b || '';
            $scope.data.cases_info_detail.push({
                case_type: 0,
                uploads: [],
                desc: ''
            });
        };
        $scope.removeChoice = function(data) {
            if (data > -1) {
                $scope.data.cases_info_detail.splice(data, 1);
            }
        };
        $scope.toggleLimitOptions = function() {
            $scope.limitOptions = $scope.limitOptions ? undefined : globalapp.pagenation;
        };
        $scope.update = function() {
            $http.put($scope.apipath + $scope.data.case_id, {
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
      
        $scope.add_data = function() {
            if ($scope.data_form.$invalid) {
                return;
            }

             if ($scope.data.cases_info_detail.length < 1) {
             
                 $mdDialog.show($mdDialog.alert().title('Case must have at least case info').ok('OK'));

                return;
            }


            if ($scope.add == false) {
               $scope.update();
                return;
            }
             $scope.addinit()
        }
        $scope.addinit = function() {
            $http.post($scope.apipath, {
                data: $scope.data
            }).then(function(response) {
                var res = angular.fromJson(response);
                if (res.data.status == 'ok') {
                    $scope.closeform(1);
                    $mdDialog.show($mdDialog.alert().title('New ' + $scope.title + ' Added').ok('OK'));
                    $scope.loaddata();
                } else {
                    $mdDialog.show($mdDialog.alert().title(res.data.data).ok('OK'));
                }
            }, function(response) {});
        }
      
        $scope.delete = function(dataid, ev) {
            var confirm = $mdDialog.confirm().title('Are you sure to delete this  ' + $scope.title + ' ?').targetEvent(ev).ok('Yes, Delete').cancel('Cancel');
            $mdDialog.show(confirm).then(function() {
                $http.delete($scope.apipath + dataid).then(function(response) {
                    $mdToast.show($mdToast.simple().textContent($scope.title + '  Deleted').position('top right').hideDelay(3000));
                    $scope.loaddata();
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
                    $scope.data.open_dt = new Date($scope.data.open_dt);
                    if ($scope.data.close_dt) {
                        $scope.data.close_dt = new Date($scope.data.close_dt);
                    }   
                    if ($scope.data.cases_info_detail) {


                       angular.forEach($scope.data.cases_info_detail, function(value, key) {

                           $scope.data.cases_info_detail[key].invoice_date =  new Date($scope.data.cases_info_detail[key].invoice_date)
                             $scope.data.cases_info_detail[key].delivery_date =  new Date($scope.data.cases_info_detail[key].delivery_date)


                            });


                    }

                    $scope.data.close_dt = new Date($scope.data.close_dt);

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