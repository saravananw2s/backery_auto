(function() {
    'use strict';
    angular.module('app').controller('CaseInfoViewCtrl', ['$rootScope', '$sce', '$stateParams', '$state', '$timeout', '$scope', '$mdEditDialog', '$q', '$http', '$mdDialog', 'api', CaseInfoViewCtrl])

    function CaseInfoViewCtrl($rootScope, $sce, $stateParams, $state, $timeout, $scope, $mdEditDialog, $q, $http, $mdDialog, api) {
        $scope.id = null;
        $scope.hide = true;
        $scope.apipath = '';
        $scope.data = {};
        $scope.visit_types = api.visit_types;
        $scope.data.rep_info = {};
        $scope.title = 'Case Report Info';
        $scope.parentState = 'admin.caseinfo';
        var networkerror = api.networkerror;
        var dataerror = api.dataerror;
        var emptymsg = api.emptymsg;
        $scope.msg = api.defaultmsg;
        $scope.map = false;
        $scope.doc = false;
        $scope.case_types = api.case_types;
        $scope.activefilter = false;
        $scope.showsearch = false;
        $scope.visit_types = api.visit_types;
        var w;
        $scope.findindex = api.arrayObjectIndexOf;
        $scope.setview = function(value, msg) {
            $scope.hide = value;
            $scope.msg = msg;
        }
        $scope.showTabDialog = function(uploads, index, ev) {
            var data = {};
            data.index = index;
            data.uploads = uploads;
            $mdDialog.show({
                locals: {
                    dataToPass: data
                },
                controller: ['$rootScope', '$sce', '$stateParams', '$state', '$timeout', '$scope', '$mdEditDialog', '$q', '$http', '$mdDialog', 'api', 'dataToPass', CaseFileCtrl],
                templateUrl: 'assets/app/case-info/case.fileupload.html',
                parent: angular.element(document.body),
                targetEvent: ev,
                multiple: true,
                clickOutsideToClose: false,
                escapeToClose: false
            }).then(function(temp) {}, function() {});
        };
        $scope.view2 = function(data, name) {
            var st = '<label>' + name + '</label> <br/><p>' + data + '<p>';
            return $sce.trustAsHtml(st);
        }
        $scope.view = function(data, name) {
            var st = '<p class="viewp"><b>' + name + ' : </b>';
            if (data == null || data == '') {
                st = st + '<span ng-show="isempty(data.type)">' + emptymsg + '</span>';
            } else {
                st = st + data;
            }
            st = st + '</p>';
            return $sce.trustAsHtml(st);
        }
        $scope.delete = function() {
            $state.go($scope.parentState, {
                mode: 'delete',
                data: $stateParams.id
            });
        }
        $scope.edit = function() {
            $state.go($scope.parentState, {
                mode: 'edit',
                data: $stateParams.id
            });
        }
        $scope.loaddata = function() {
            $http.get($scope.apipath).then(function(response) {
                var res = angular.fromJson(response);
                if (res.data.status == 'ok' && res.data.data != null) {
                    $scope.data = res.data.data;
                    $scope.data.uploads = angular.fromJson(res.data.data.uploads);
                    var temp = api.getemp_name($scope.data.taken_by);
                    temp().then().then(function(value) {
                        $scope.data.taken_by = value.data.user_id + ' - ' + value.data.last_name + ' ' + value.data.first_name;
                    });
                    var temp = api.getemp_name($scope.data.closed_by);
                    temp().then().then(function(value) {
                        $scope.data.closed_by = value.data.user_id + ' - ' + value.data.last_name + ' ' + value.data.first_name;
                    });
                    var temp = api.getcustomer_name($scope.data.cust_id);
                    temp().then().then(function(value) {
                        $scope.data.cust_id = value.data.id + ' - ' + value.data.name;
                    });
                    angular.forEach($scope.data.cases_info_detail, function(value, key) {
                        if (value.product_id) {
                            var temp = api.getproduct_name(value.product_id);
                            temp().then().then(function(data) {
                                $scope.data.cases_info_detail[key].product_id = data.data.name;
                            });
                        }
                    });
                } else {
                    $scope.setview(true, dataerror);
                }
            }, function(response) {
                $scope.setview(true, networkerror);
            });
        }
        if ($stateParams.id) {
            $scope.id = api.decode($stateParams.id);
            $scope.hide = false;
            $scope.apipath = 'caseinfo/' + $scope.id;
            $scope.loaddata();
        }
    }
})();