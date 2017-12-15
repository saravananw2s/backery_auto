(function() {
    'use strict';
    angular.module('app').controller('ForgotCtrl', ['$scope', 'api', '$state', '$stateParams', '$location', '$http', 'localStorageService', ForgotCtrl])

    function ForgotCtrl($scope, api, $state, $stateParams, $location, $http, localStorageService) {
        if (localStorageService.isSupported) {
            var token = localStorageService.get('apitoken');
            if (token !== null) {
                $state.go('admin.dashboard'); // go to login
            }
        }

        $scope.submit = false;
        var textColor = '#989898' // label, legend etc.
            ,
            splitLineColor = 'rgba(0,0,0,.05)',
            splitAreaColor = ['rgba(250,250,250,0.035)', 'rgba(200,200,200,0.1)']
        var original;
        $scope.user = {
            email: '',
            password: ''
        }
        original = angular.copy($scope.user);
        $scope.revert = function() {
            $scope.user = angular.copy(original);
            $scope.material_login_form.$setPristine();
            $scope.material_login_form.$setUntouched();
            return;
        };
        $scope.auth = function() {
            if ($scope.material_login_form.$valid && !angular.equals($scope.user, original)) {
                var data = {
                    email: '',
                    password: ''
                };
                data.email = $scope.user.email;
                $http.post('forget', {
                    data: data
                }).success(function(data, status) {
                    var res = angular.fromJson(data);
                    console.log(res.status);
                    if (res.status === 'ok') {  
                       
                        $scope.alert = res.data;
                              $scope.submit = true;
                    } else {
                        localStorageService.remove("apitoken");
                        if (res.data instanceof Array) {
                            $scope.alert = res.data[0];
                        } else {
                            $scope.alert = res.data;
                        }
                    }
                });
            } else {
                $scope.alert = 'Check the Inputs';
            }
        };
    }
})();
