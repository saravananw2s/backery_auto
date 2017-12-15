(function() {
    'use strict';
    angular.module('app').controller('ScheduleViewCtrl', ['$rootScope', '$sce', '$stateParams', '$state', '$timeout', '$scope', '$mdEditDialog', '$q', '$http', '$mdDialog', 'api', ScheduleViewCtrl])

    function ScheduleViewCtrl($rootScope, $sce, $stateParams, $state, $timeout, $scope, $mdEditDialog, $q, $http, $mdDialog, api) {
        $scope.id = null;
        $scope.hide = true;
        $scope.apipath = '';
        $scope.data = {};
        $scope.scheduletypes = api.scheduletypes;
        $scope.title = 'Schedule Info';
        $scope.parentState = 'admin.schedule';
        var networkerror = api.networkerror;
        var dataerror = api.dataerror;
        var emptymsg = api.emptymsg;
        $scope.msg = api.defaultmsg;
        $scope.customers = [];
        $scope.cust_jobs = [];
        $scope.mapArray = [];
        $scope.tempcus = api.customers();

        $scope.clat = 40.74, $scope.clng = -74.18;
        $scope.map = false;
        $scope.doc = false;
        $scope.setview = function(value, msg) {
            $scope.hide = value;
            $scope.msg = msg;
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


             $scope.tempcus().then().then(function(data) {
            $scope.customers = data.data;





            $http.get($scope.apipath).then(function(response) {
                var res = angular.fromJson(response);
                if (res.data.status == 'ok' && res.data.data != null) {
                    $scope.data = res.data.data;
                    var temp = api.getemp_name($scope.data.emp);
                    temp().then().then(function(value) {
                        $scope.data.emp =value.data.first_name + ' ' + value.data.last_name;
                    });
                    var temp = api.getemp_name($scope.data.add_by);
                    temp().then().then(function(value) {
                        $scope.data.add_by = value.data.first_name + ' ' + value.data.last_name;
                    });
                    $scope.cust_jobs = $scope.data.cust_jobs;


                    var temp = 1;
                    angular.forEach($scope.data.cust_jobs, function(key, value) {
                        var data = _.find($scope.customers, {
                            id: parseInt(key.cust_id)
                        })
                        if (data) {
                            if (temp == 1) {
                                $scope.clat = data.loc_lat;
                                $scope.clng = data.loc_lng;
                                temp = 0;
                            }
                            $scope.mapArray.push({
                                "id": data.id,
                                "loc_lat": data.loc_lat,
                                "loc_lng": data.loc_lng,
                            })
                        }
                    });

                    $timeout(function() {
                $scope.$apply();
            }, 0);

                } else {
                    $scope.setview(true, dataerror);
                }
            }, function(response) {
                $scope.setview(true, networkerror);
            })
             });
        }
        if ($stateParams.id) {
            $scope.id = api.decode($stateParams.id);
            $scope.hide = false;
            $scope.apipath = 'task/' + $scope.id;
            $scope.loaddata();
        }
    }
})();
