(function() {
    'use strict';

    angular.module('app').controller('LogoutCtrl', ['$scope', '$state', '$stateParams', '$location', '$http', 'localStorageService', LogoutCtrl])

    function LogoutCtrl($scope, $state, $stateParams, $location, $http, localStorageService) {

        $scope.data = {};

       $scope.data.token = localStorageService.get("apitoken");
        
        var client_data =  new Fingerprint2();;

        var info = client_data.get(function(result) {

            $scope.data.client_data = result;

         $http.post('logout', { data: $scope.data });


        });

           
        localStorageService.clearAll();

        $state.go('signin'); // go to login

        return;


    }




})();
