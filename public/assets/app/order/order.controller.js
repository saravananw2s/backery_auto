(function() {
    'use strict';
    angular.module('app').controller('OrderCtrl', ['$rootScope', '$filter', '$state', '$stateParams', '$mdToast', '$timeout', '$scope', '$mdEditDialog', '$q', '$http', '$mdDialog', 'api', OrderCtrl])

    function OrderCtrl($rootScope, $filter, $state, $stateParams, $mdToast, $timeout, $scope, $mdEditDialog, $q, $http, $mdDialog, api) {
        $scope.auto = api.autogenrateno;
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
            $state.go('admin.orderview', {
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
        $scope.title = 'Order';
        $scope.apipath = 'order/';
        $scope.showform = false;
        $scope.add = true;
        $scope.data = {};
        $scope.activity = [];
        $scope.total = 0;
        $scope.activitytemp = api.activity();
        $scope.activitytemp().then().then(function(data) {
            $scope.activity = data.data;
        });
        $scope.activefilter = false;
        $scope.showsearch = false;
        $scope.visit_types = api.visit_types;
        $scope.order_status = api.order_status;
        var w;
        var original;
        $scope.smart = true;
        $scope.wwstatus = true;
        $scope.datatable = {};
        $scope.datatable.data = [];
        $scope.users = [];
        $scope.tempusers = api.users();
        $scope.tempusers().then().then(function(data) {
            $scope.users = data.data;
        });
        $scope.product = [];
        $scope.tempproduct = api.product();
        $scope.tempproduct().then().then(function(data) {
            $scope.product = data.data;
        });
        $scope.customers = [];
        $scope.tempcustomers = api.customers();
        $scope.tempcustomers().then().then(function(data) {
            $scope.customers = data.data;
        });
        $scope.data.loc_lat = 0;
        $scope.data.loc_lng = 0;
        $scope.users = [];
        $scope.data.product_info = [];
        $scope.temp = api.users();
        $scope.temp().then().then(function(data) {
            $scope.users = data.data;
        });
        $scope.customers = [];
        $scope.tempcus = api.customers();
        $scope.tempcus().then().then(function(data) {
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
            name: "order_booking_id",
            display: "Order ID"
        }, {
            name: "taken_by",
            display: "Taken BY"
        }, {
            name: "order_date",
            display: "Order Date"
        }, {
            name: "po_date",
            display: "PO Date"
        }, {
            name: "customer",
            display: "Customer"
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
            $scope.data.order_date = new Date();
            $scope.data.po_date = new Date();
            $scope.data.status = 0;
            $scope.data.product_info = [];
            $scope.data.loc_lat = 0;
            $scope.data.loc_lng = 0;
            $scope.data.files_info = [];
            $scope.files = [];
            $scope.isFilesNull = true;
            $scope.mapzoom = 12;
            $scope.total = 0;
        };
        $scope.productChange = function(index, product_id) {
            var product = $filter('filter')($scope.product, {
                product_id: product_id
            })[0];
            console.log(product)
            console.log($scope.data.product_info[index].pro_price)
            console.log($scope.data.product_info[index].pro_quantity)
            $scope.data.product_info[index].pro_price = (parseFloat($scope.data.product_info[index].pro_quantity) * parseFloat(product.price)).toFixed(2);
        }
        $scope.CustomerChange = function() {
            var customer = $filter('filter')($scope.customers, {
                id: $scope.data.cust_id
            })[0];
            if (customer) {
                $scope.data.ship_to = customer.address + ',' + customer.district + ',' + customer.city + ',' + customer.location;
                $scope.data.bil_to = customer.address + ',' + customer.district + ',' + customer.city + ',' + customer.location;
            }
            // console.log(customer)
            // console.log($scope.data.product_info[index].pro_price)
            // console.log($scope.data.product_info[index].pro_quantity)
        }
        $scope.toggleLimitOptions = function() {
            $scope.limitOptions = $scope.limitOptions ? undefined : globalapp.pagenation;
        };
        $scope.addNewChoice = function(b = '') {
            console.log('hit')
            $scope.data.product_info.push({
                product_id: '',
                pro_req_date: new Date(),
                pro_quantity: '',
                pro_price: ''
            });
        };
        $scope.removeChoice = function(data) {
            if (data > -1) {
                $scope.data.product_info.splice(data, 1);
            }
        };
        $scope.update = function() {
            $http.put($scope.apipath + $scope.data.order_booking_id, {
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
                        $scope.data.files_info = $scope.data.files_info.concat(res.data);
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
            if ($scope.data.product_info.length == 0) {
                $mdDialog.show($mdDialog.alert().title('Order must have at least one product').ok('OK'));
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
                $scope.data.files_info.splice(file, 1);
            }, function() {});
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
            var ev = '';
            if ($scope.data_form.$dirty) {
                var confirm = $mdDialog.confirm().title('You will lose unsaved changes if you do this action ?').targetEvent(ev).ok('OK, Do it').cancel('Cancel');
                $mdDialog.show(confirm).then(function() {
                    $http.get($scope.apipath + dataid).then(function(response) {
                        var res = angular.fromJson(response);
                        if (res.data.status == 'ok') {
                            $scope.data = res.data.data;
                            $scope.data.files_info = angular.fromJson($scope.data.files_info);
                            $scope.data.product_info = angular.fromJson($scope.data.product_info);
                            $scope.data.po_date = new Date($scope.data.po_date);
                            $scope.data.order_date = new Date($scope.data.order_date);
                            angular.forEach($scope.data.product_info, function(value, key) {
                                $scope.data.product_info[key]['pro_req_date'] = new Date($scope.data.product_info[key]['pro_req_date']);
                            });
                            $scope.showform = true;
                            $scope.add = false;
                            $scope.data_form.$dirty = false;
                        } else {}
                    }, function(response) {
                        // failure call back
                    });
                }, function() {});
            } else {
                $http.get($scope.apipath + dataid).then(function(response) {
                    var res = angular.fromJson(response);
                    if (res.data.status == 'ok') {
                        $scope.data = res.data.data;
                        $scope.data.files_info = angular.fromJson($scope.data.files_info);
                        $scope.data.product_info = angular.fromJson($scope.data.product_info);
                        $scope.data.po_date = new Date($scope.data.po_date);
                        $scope.data.order_date = new Date($scope.data.order_date);
                        angular.forEach($scope.data.product_info, function(value, key) {
                            $scope.data.product_info[key]['pro_req_date'] = new Date($scope.data.product_info[key]['pro_req_date']);
                        });
                        $scope.showform = true;
                        $scope.add = false;
                        $scope.data_form.$dirty = false;
                    } else {}
                }, function(response) {
                    // failure call back
                });
            }
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