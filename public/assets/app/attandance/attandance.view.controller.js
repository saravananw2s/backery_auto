(function() {
    'use strict';



    angular.module('app')
        .controller('AttandanceViewCtrl', ['$rootScope', '$sce', '$stateParams', '$state', '$timeout', '$scope', '$mdEditDialog', '$q', '$http', '$mdDialog', 'api', AttandanceViewCtrl])


    function AttandanceViewCtrl($rootScope, $sce, $stateParams, $state, $timeout, $scope, $mdEditDialog, $q, $http, $mdDialog, api) {
        $scope.id = null;
        $scope.hide = true;
        $scope.apipath = '';
        $scope.data = {};
        $scope.visit_types = api.visit_types;
        $scope.data.rep_info = {};
        $scope.title = 'Attendance Info';
        $scope.parentState = 'admin.attandance';
        var networkerror = api.networkerror;
        var dataerror = api.dataerror;
        var emptymsg = api.emptymsg;
        $scope.msg = api.defaultmsg;
        $scope.map = false;
        $scope.map1 = false;
        $scope.doc = false;
   
        $scope.findindex = api.arrayObjectIndexOf;


          $scope.attendance_type = api.attendance_type;
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

            $state.go($scope.parentState, { mode: 'delete', data: $stateParams.id });
        }


        $scope.edit = function() {

            $state.go($scope.parentState, { mode: 'edit', data: $stateParams.id });
        }

        $scope.loaddata = function() {
            $http.get($scope.apipath)
                .then(
                    function(response) {

                        var res = angular.fromJson(response);

                        if (res.data.status == 'ok' && res.data.data != null) {

                            $scope.data = res.data.data;


                    if ($scope.data.login_lat != null && scope.data.login_lon  != null) {

                         $scope.map = true;
                }

  if ($scope.data.logout_lat  != null && scope.data.logout_lon  != null) {
 $scope.map1 = true;
                }


                            var temp = api.getemp_name($scope.data.user_id);
                            temp().then().then(function(value) {
                                $scope.data.user_id = value.data.user_id + ' - ' + value.data.last_name + ' ' + value.data.first_name;
                            });



                        } else {

                            $scope.setview(true, dataerror);
                        }
                    },
                    function(response) {


                        $scope.setview(true, networkerror);
                    }
                );
        }


        if ($stateParams.id) {
            $scope.id = api.decode($stateParams.id);
            $scope.hide = false;
            $scope.apipath = 'attendance/' + $scope.id;
            $scope.loaddata();
        }













    }
})();
