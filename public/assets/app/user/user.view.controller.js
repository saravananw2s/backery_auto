(function() {
    'use strict';


    angular.module('app')
        .controller('UserViewCtrl', ['$rootScope', '$sce', '$stateParams', '$state', '$timeout', '$scope', '$mdEditDialog', '$q', '$http', '$mdDialog', 'api', UserViewCtrl])


    function UserViewCtrl($rootScope, $sce, $stateParams, $state, $timeout, $scope, $mdEditDialog, $q, $http, $mdDialog, api) {
        $scope.id = null;
        $scope.hide = true;
         $scope.cust = false;
        $scope.apipath = '';
        $scope.data = {};
        $scope.title = 'Employee Info';
        $scope.parentState = 'admin.user';
        $scope.roles = [];
        $scope.active = api.active;
        $scope.temproles = api.roles();
        $scope.temproles().then().then(function(data) {
            $scope.roles = data.data;
        });
        var networkerror = api.networkerror;
        var dataerror = api.dataerror;
        var emptymsg = api.emptymsg;
        $scope.msg = api.defaultmsg;
        $scope.map = false;
        $scope.doc = false;
        $scope.complete = false;
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
                            $scope.data.profile_image = angular.fromJson(res.data.data.profile_image);

                            if($scope.data.profile_image)
                            {
                            $scope.doc = true;
                            }

                            $scope.data.cust = angular.fromJson(res.data.data.cust);

                            if($scope.data.cust.length > 0)
                            {
                            $scope.cust = true;
                            }


                
                            $scope.complete = true;

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
            $scope.apipath = 'user/' + $scope.id+'?belongs=yes';
            $scope.loaddata();
        }



    }
})();
