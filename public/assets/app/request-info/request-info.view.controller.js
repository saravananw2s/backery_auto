(function() {
    'use strict';



    angular.module('app')
        .controller('RequestViewCtrl', ['$rootScope', '$sce', '$stateParams', '$state', '$timeout', '$scope', '$mdEditDialog', '$q', '$http', '$mdDialog', 'api', RequestViewCtrl])


    function RequestViewCtrl($rootScope, $sce, $stateParams, $state, $timeout, $scope, $mdEditDialog, $q, $http, $mdDialog, api) {
        $scope.id = null;
        $scope.hide = true;
        $scope.apipath = '';
        $scope.data = {};
        $scope.visit_types = api.visit_types;
        $scope.data.rep_info = {};
        $scope.title = 'Request Info';
        $scope.parentState = 'admin.requestinfo';
        var networkerror = api.networkerror;
        var dataerror = api.dataerror;
        var emptymsg = api.emptymsg;
        $scope.msg = api.defaultmsg;
        $scope.map = false;
        $scope.doc = false;
        $scope.comp = [];
        $scope.activity =[];

               $scope.requesttype = api.requesttype;
        $scope.visit_types = api.visit_types;
    $scope.data.request_info = [];
        $scope.temp = api.users();
        $scope.temp().then().then(function(data) {
            $scope.users = data.data;
        });
            $scope.customers = [];
        $scope.tempcus = api.customers();

        $scope.tempcus().then().then(function(data) {

            $scope.customers = data.data;

        });


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

                            var temp = api.getemp_name($scope.data.taken_by);
                            temp().then().then(function(value) {
                                $scope.data.taken_by = value.data.user_id + ' - ' + value.data.last_name + ' ' + value.data.first_name;
                            });

                            var temp = api.getcustomer_name($scope.data.cust_id);
                            temp().then().then(function(value) {
                                $scope.data.cust_id = value.data.id + ' - ' + value.data.name;
                            });


                            $scope.request_info = $scope.data.request_info;


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
            $scope.apipath = 'request/' + $scope.id;
            $scope.loaddata();
        }













    }
})();
