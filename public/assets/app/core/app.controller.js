

(function() {
    'use strict';

    angular.module('app')
        .controller('RootCtrl', ['$rootScope', '$scope', 'api','$timeout', '$state', RootCtrl]) // overall control
        .controller('AppCtrl', ['$scope', '$rootScope', '$document', 'appConfig', '$state', '$mdSidenav', '$mdComponentRegistry', 'api', '$timeout', AppCtrl]) // overall control
        .controller('SidenavRightCtrl', ['$scope', '$mdSidenav', SidenavRightCtrl])


    function AppCtrl($scope, $rootScope, $document, appConfig, $state, $mdSidenav, $mdComponentRegistry, api, $timeout) {

        $scope.pageTransitionOpts = appConfig.pageTransitionOpts;
        $scope.app = appConfig.app;
        $scope.color = appConfig.color;
        $scope.show_menu = api.show_menu();






$scope.$watch(api.show_menu, function(newVal,oldVal) {

  $scope.show_menu = api.show_menu();

  });


$scope.$on('$stateChangeSuccess', function () {

    // $timeout(function() {
 console.log($state.current.name);

       api.showDemoonceAlert($state.current.name);
    // }, 1000);

});

        // Checks if the given state/child states are present
        $scope.includes = function(name) {
            return $state.includes(name);
        }


        //
        $rootScope.$on("$stateChangeSuccess", function(event, currentRoute, previousRoute) {
            window.scrollTo(0, 0);
        });


        // for mdSideNav right
        $scope.toggleRight = buildToggler('right');
        $scope.isOpenRight = function() {
            if (!$mdComponentRegistry.get('right')) return;

            return $mdSidenav('right').isOpen();
        };

        function buildToggler(navID) {
            return function() {
                // Component lookup should always be available since we are not using `ng-if`
                $mdSidenav(navID).toggle();
            }
        }
    }

    function RootCtrl($rootScope, $scope, api, $timeout, $state) {



$scope.showDemo = function (argument) {

api.showDemoAlert($state.current.name);

}


if(api.superAdmin())
{


    $scope.init = function()
    {
        $scope.rootapis = [];


            $scope.rootapis = api.master_getDb();

            $scope.rootapis().then().then(function(data) {

                $scope.rootapis = angular.fromJson(data.data);

                if (api.get_apiurl() == null) {

                    api.update_menu(false);
                    //$scope.set($scope.rootapis[0].company_name, $scope.rootapis[0].domain.sub_domain_url,1)
                } else {

                    angular.forEach($scope.rootapis, function(value, key) {

                        if (api.get_apiurl() == value.domain.sub_domain_url) {
                            $scope.company = value.company_name;
                        }

                    });



                }

            });



}
  $scope.init();

        $scope.set = function(name, url,s) {

               s = s || 0;

            $scope.company = name;
            $scope.url = url;
            api.set_apiurl(url);

            angular.forEach($scope.rootapis, function(value, key) {

                if (api.get_apiurl() == value.domain.sub_domain_url) {
                    $scope.company = value.company_name;
                      api.update_menu(true);
                }

            });

            if(s == 0)
            {
            $state.go('admin.company_dashboard');
        }
        }


$scope.$watch(api.updateroots, function(newVal,oldVal) {

if(newVal === true)
{
    $scope.init();
}

  });




    }
    }




    function SidenavRightCtrl($scope, $mdSidenav) {
        $scope.close = function() {
            // Component lookup should always be available since we are not using `ng-if`
            $mdSidenav('right').close()
        };
    }

})();


