(function() {
    'use strict';
    angular.module('app').controller('MapCtrl', ['$rootScope', '$state', '$stateParams', '$mdToast', '$timeout','$filter', '$scope', '$interval', '$q', '$http', '$mdDialog', 'api', MapCtrl])

    function MapCtrl($rootScope, $state, $stateParams, $mdToast, $timeout, $filter,$scope, $interval, $q, $http, $mdDialog, api) {
        $scope.mapshow = false;
        $scope.onlineemp = [];
        $scope.emppath = [];
        $scope.data = [];
        $scope.mapcenter = api.mapcenter;
        $scope.zoom = 5;
        $scope.customers = [];
        $scope.tempcus = api.customers();
        $scope.tempcus().then().then(function(data) {
            $scope.customers = data.data;
        });
        $scope.competitorinfo = [];
        $scope.tempcompetitor = api.competitor();
        $scope.tempcompetitor().then().then(function(data) {
            $scope.competitorinfo = data.data;
        });

        $scope.pan = function()
        {
            $scope.filteredItems = $filter('filter')($scope.onlineemp, $scope.location);
            if($scope.filteredItems)
            {
                if($scope.filteredItems[0])
                {
                         $scope.mapcenter = [$scope.filteredItems[0].lat,$scope.filteredItems[0].lng];
                         $scope.zoom = 13;
                }

            }

             if(!$scope.location)
             {
                $scope.zoom = 5;
                $scope.mapcenter = api.mapcenter;
             }
        }
        if (api.manager()) {
            $scope.user_id = '';
            $scope.profile = api.profile();
            $scope.profile().then().then(function(data) {
                $scope.user_id = data.data.user_id;
                window.Echo.private(globalapp.channel + 'user-' + $scope.user_id).listen('LocationUpdate', (e) => {
                    var index = _.findIndex($scope.onlineemp, function(item) {
                        return item.user_id == e.data.user_id
                    })
                    console.log($scope.onlineemp);
                    console.log(index);
                    if (index > -1) {
                        $scope.onlineemp[index] = e.data;
                    } else {
                        $scope.onlineemp.push(e.data);
                    }
                    $scope.$apply();
                });
            });
        } else {

            if(api.superAdmin())
            {
            var domain =api.getSubDomain() + '-';
            }
            else
            {
                var domain = globalapp.channel;
            }
            window.Echo.private(domain + 'current_location').listen('LocationUpdate', (e) => {
                var index = _.findIndex($scope.onlineemp, function(item) {
                    return item.user_id == e.data.user_id
                })
                console.log(index);
                if (index > -1) {
                    $scope.onlineemp[index] = e.data;
                } else {
                    $scope.onlineemp.push(e.data);
                }
                $scope.$apply();
            });
        }

        $scope.content = function($data)
        {


 
         var info =  '<p>Emp id :' + $data['user']['user_id']
                + '</p> '
                + '<p>Name :' + $data['user']['last_name']
                + ' '
                + $data['user']['first_name']
                + '</p> '
                + '<p> Active : '
                + api.timeago($data['timestamp'])  + ' </p>'

                ;

                return info;

          
        }
        // function GetEmpData(id) {
        //     var id = id;
        //     $http.get('location_emp_api/' + id).success(function(response) {
        //         $scope.emppath = response.data;
        //     });
        // }
        function GetOnlineEmp() {
            if ($state.current.name == 'admin.map') {
                $http.get('location_online_emp').success(function(response) {
                    $scope.onlineemp = [];
                    angular.forEach(response.data, function(element) {
                        $scope.onlineemp.push(element);
                    });
                });
                // // $timeout(GetOnlineEmp, 10000);
            } else {}
        }
        $scope.$on('$viewContentLoaded', function() {
            $scope.mapshow = true;
            GetOnlineEmp();
        })
    }
})();