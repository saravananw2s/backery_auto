(function() {
    'use strict';
    angular.module('app').controller('AppSidenavRightCtrl', ['$scope', '$http', 'api', '$timeout', '$rootScope', AppSidenavRightCtrl])

    function AppSidenavRightCtrl($scope, $http, api, $timeout, $rootScope) {
        $scope.messages_mob = [];
        $scope.messages_web = [];
        $scope.notifications = [];
        $scope.newcount = 0;
        $scope.locations = [];
        $scope.notificationsPage = 1;
        $scope.tempcus = api.customers();
        $scope.tempcus().then().then(function(data) {
            $scope.locations = data.data;
        });
        $scope.temp = api.users();
        $scope.temp().then().then(function(data) {
            $scope.users = data.data;
        });
        $scope.parseInt = parseInt;
        $scope.Increment = function() {
            $scope.newcount = $scope.newcount + 1;
            $timeout(function() {
                $rootScope.$digest()
            }, 10);
        }
        $scope.Decrement = function() {
            $scope.newcount = $scope.newcount - 1;
            $timeout(function() {
                $rootScope.$digest()
            }, 10);
        }
        $scope.ReadMyNotifications = function(data) {
            var id = _.findIndex($scope.notifications, ['id', data]);
            if (typeof id !== 'undefined') {
                $scope.notifications[id].read_at = new Date();
                $scope.Decrement();
                var id = $scope.notifications[id].id;
                $http.get('ReadMyNotifications/' + id).success(function(response) {});
            }
        }
        $scope.GetNotify = function() {
            $http.get('GetMyNotifications?page=' + $scope.notificationsPage).success(function(response) {
                var alert = false;
                $scope.newcount = $scope.newcount + response.total;
                $scope.notificationsPage = response.current_page + 1;
                angular.forEach(response.data, function(element) {
                    $scope.notifications.push(element);
                });
            })
        };
        $scope.GetNotify();
        $rootScope.$on('NotificationEvent', function(e, args) {
            if (args) {
                $scope.Increment();
                globalapp.alert();
                $scope.notifications.push(args.data)
            }
        });

    }
})();
