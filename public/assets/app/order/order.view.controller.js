(function() {
    'use strict';



    angular.module('app')
        .controller('OrderViewCtrl', ['$rootScope', '$sce', '$stateParams', '$state', '$timeout', '$scope', '$mdEditDialog', '$q', '$http', '$mdDialog', 'api', OrderViewCtrl])


    function OrderViewCtrl($rootScope, $sce, $stateParams, $state, $timeout, $scope, $mdEditDialog, $q, $http, $mdDialog, api) {
        $scope.id = null;
        $scope.hide = true;
        $scope.apipath = '';
        $scope.data = {};
        $scope.total = 0;
        $scope.visit_types = api.visit_types;
        $scope.data.product_info = [];
        $scope.title = 'Order Info';
        $scope.parentState = 'admin.order';
        var networkerror = api.networkerror;
        var dataerror = api.dataerror;
        var emptymsg = api.emptymsg;
        $scope.msg = api.defaultmsg;
                $scope.order_status = api.order_status;
        $scope.map = false;
        $scope.doc = false;
        $scope.comp = [];
              $scope.product  = [];
        $scope.tempproduct = api.product();
        $scope.tempproduct().then().then(function(data) {
            $scope.product = data.data;
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
                            $scope.data.uploads = angular.fromJson(res.data.data.files_info);


                            if ($scope.data.uploads.length > 0) {
                                $scope.doc = true;
                            }   

                            for (var i =  $scope.data.product_info.length - 1; i >= 0; i--) {

                              $scope.total =   parseFloat($scope.total + parseFloat($scope.data.product_info[i].pro_price));

                               $scope.total =  $scope.total.toFixed(2);

                            }
                            
                                 var temp = api.getemp_name($scope.data.emp_id);
                            temp().then().then(function(value) {
                                $scope.data.emp_id = value.data.user_id + ' - ' + value.data.last_name + ' ' + value.data.first_name;
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
            $scope.apipath = 'order/' + $scope.id;
            $scope.loaddata();
        }













    }
})();
