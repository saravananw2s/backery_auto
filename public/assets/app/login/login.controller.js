(function() {
    'use strict';
    angular.module('app').controller('LoginCtrl', ['$scope', 'api', '$state', '$stateParams', '$location', '$http', 'localStorageService', LoginCtrl])

    function LoginCtrl($scope, api, $state, $stateParams, $location, $http, localStorageService) {


        if (localStorageService.isSupported) {
            var token = localStorageService.get('apitoken');
            if (token !== null) {
                $state.go('admin.map');
            }
        }
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
                data.password = $scope.user.password;
                $http.post('auth?api=web', {
                    data: data
                }).success(function(data, status) {
                    var res = angular.fromJson(data);
                    console.log(res.status);
                    if (res.status === 'ok') {
                        localStorageService.set("apitoken", res.data.token);
                        localStorageService.set("role", res.data.role);
                        if(res.data.demo_links)
                        {
                        localStorageService.set("demo_links", res.data.demo_links);
                        }
                        else
                        {
                               localStorageService.set("demo_links", []);
                        }
                        if (res.data.role === 'super_admin') {
                            api.set_apiurl(null);
                        }
                        $state.go('admin.user');
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
