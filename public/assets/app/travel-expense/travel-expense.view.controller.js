(function() {
    'use strict';



    angular.module('app')
        .controller('TravelExpenseViewCtrl', ['$rootScope', '$sce', '$stateParams', '$state', '$timeout', '$scope', '$mdEditDialog', '$q', '$http', '$mdDialog', 'api', TravelExpenseViewCtrl])


    function TravelExpenseViewCtrl($rootScope, $sce, $stateParams, $state, $timeout, $scope, $mdEditDialog, $q, $http, $mdDialog, api) {
        $scope.id = null;
        $scope.hide = true;
        $scope.apipath = '';
        $scope.data = {};
        $scope.visit_types = api.visit_types;
        $scope.data.rep_info = {};
        $scope.title = 'Travel Expense Info';
        $scope.parentState = 'admin.travelexpense';
        var networkerror = api.networkerror;
        var dataerror = api.dataerror;
        var emptymsg = api.emptymsg;
        $scope.msg = api.defaultmsg;
        $scope.map = false;
        $scope.doc = false;
        $scope.comp = [];
        $scope.with_manager = api.with_manager;
        $scope.activity =[];
        $scope.hotel_exp = [];
        $scope.travel_exp = [];

        $scope.findindex = api.arrayObjectIndexOf;
        var temp = api.competitor();

        temp().then().then(function(value) {

          $scope.comp = value.data;
       });



          $scope.companytype = api.companytype;
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
                            $scope.data.uploads = angular.fromJson(res.data.data.uploads);

                            var temp = api.getemp_name($scope.data.user_id);
                            temp().then().then(function(value) {
                                $scope.data.user_id = value.data.user_id + ' - ' + value.data.last_name + ' ' + value.data.first_name;
                            });

                            $scope.hotel_exp = $scope.data.hotel_exp;
                            $scope.travel_exp = $scope.data.travel_exp;


                            if ($scope.data.uploads.length > 0) {
                                $scope.doc = true;
                            }
                            $scope.map = false;


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
            $scope.apipath = 'travelexpense/' + $scope.id;
            $scope.loaddata();
        }













    }
})();
