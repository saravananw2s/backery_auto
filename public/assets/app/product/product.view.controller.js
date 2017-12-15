(function() {
    'use strict';


    angular.module('app')
        .controller('ProductViewCtrl', ['$rootScope', '$sce', '$stateParams', '$state', '$timeout', '$scope', '$mdEditDialog', '$q', '$http', '$mdDialog', 'api', ProductViewCtrl])


    function ProductViewCtrl($rootScope, $sce, $stateParams, $state, $timeout, $scope, $mdEditDialog, $q, $http, $mdDialog, api) {
        $scope.id = null;
        $scope.hide = true;
        $scope.apipath = '';
        $scope.data = {};
        $scope.title = 'Product Info';
        $scope.parentState = 'admin.product';
        $scope.category = [];
        $scope.categorytemp = api.category();

        $scope.categorytemp().then().then(function(data) {

            $scope.category = data.data;

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
                            $scope.data.photos = angular.fromJson(res.data.data.photos);
                             angular.forEach($scope.category, function(value, key) {
                                if (value.id == $scope.data.category) {
                                    $scope.data.category = value.name;
                                }
                            });

                            $scope.doc = true;
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
            $scope.apipath = 'product/' + $scope.id;
            $scope.loaddata();
        }



    }
})();
