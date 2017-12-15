(function() {
    'use strict';



    angular.module('app')
        .controller('ProfileCtrl', ['$rootScope', '$state', '$stateParams', '$mdToast', '$timeout', '$scope', '$mdEditDialog', '$q', '$http', '$mdDialog', 'api', ProfileCtrl])

    function ProfileCtrl($rootScope, $state, $stateParams, $mdToast, $timeout, $scope, $mdEditDialog, $q, $http, $mdDialog, api) {











        $scope.title = 'Profile';
        $scope.apipath = 'profile/';
        $scope.data = {};
        $scope.role = api.getrole();

        $scope.pwd = {};
        $scope.pwd.old = '';
        $scope.pwd.new = '';
        $scope.pwd.confirm = '';

        var old = [];



        $scope.reset = function() {

            if ($scope.lfApi) {
                $scope.lfApi.removeAll()
            }
            $scope.data_form.$setPristine();
            $scope.data_form.$setUntouched();

            $scope.pwd_reset_form.$setPristine();
            $scope.pwd_reset_form.$setUntouched();

            $scope.data = {};
            $scope.data.profile_image = [];
            $scope.files = [];
            $scope.isFilesNull = true;
            old = [];
            $scope.pwd = {};
            $scope.pwd.old = '';
            $scope.pwd.new = '';
            $scope.pwd.confirm = '';

            $scope.update_info();
        };


        $scope.ProfileUpdate = function() {


            if ($scope.data_form.$invalid) {

                return;
            }


            // if ($scope.files.length == 1) {
            //     var upload = api.upload($scope.files, 'img');
            //     upload().then().then(function(res) {

            //         var res = angular.fromJson(res);
            //         if (res.status == 'ok') {

            //             old = $scope.data.profile_image;
            //             $scope.data.profile_image = res.data;
            //             $scope.initput();
            //         } else {
            //             $mdDialog.show(
            //                 $mdDialog.alert()
            //                 .title(res.data).ok('OK')
            //             );
            //         }

            //     });

            // } else {
                $scope.initput();
            // }


        }

        $scope.PasswordReset = function() {

            if ($scope.pwd_reset_form.$invalid) {

                return;
            }


            $http.put('change_password_emp', {
                    data: {
                        'old_password': $scope.pwd.old,
                        'new_password': $scope.pwd.new,
                        'confirm_password': $scope.pwd.confirm,
                    }
                })
                .then(
                    function(response) {

                        var res = angular.fromJson(response);


                        if (res.data.status == 'ok') {

                            $mdDialog.show(
                                $mdDialog.alert()
                                .title('Password Changed').ok('OK')
                            );

                            $scope.reset();




                        } else {



                            $mdDialog.show(
                                $mdDialog.alert()
                                .title(res.data.data).ok('OK')
                            );


                        }


                    },
                    function(response) {


                    }
                );




        }

        $scope.FileDelete = function(file, ev) {
            // Appending dialog to document.body to cover sidenav in docs app
            var confirm = $mdDialog.confirm()
                .title('Are you sure to delete this  File ?')
                .targetEvent(ev)
                .ok('Yes, Delete')
                .cancel('Cancel');
            $mdDialog.show(confirm).then(function() {

                $scope.data.profile_image.splice(file, 1);

            }, function() {});

        }






        $scope.initput = function() {
            $http.put('updateprofile', { data: $scope.data })
                .then(
                    function(response) {

                        var res = angular.fromJson(response)


                        if (res.data.status == 'ok') {

                            $mdDialog.show(
                                $mdDialog.alert()
                                .title($scope.title + '  Info Updated').ok('OK')
                            );

                            $scope.update_info();


                        } else {

                            $mdDialog.show(
                                $mdDialog.alert()
                                .title(res.data.data).ok('OK')
                            );


                            $scope.data.profile_image = old;


                        }
                    }

                );
        }

        $scope.update_info = function() {

            $http.get($scope.apipath)
                .then(
                    function(response) {

                        var res = angular.fromJson(response);



                        if (res.data.status == 'ok') {


                            $scope.data = res.data.data;


                            $scope.data.profile_image = angular.fromJson($scope.data.profile_image);

                        } else {


                        }
                    },
                    function(response) {

                    }
                );



        }






        $scope.update_info();



    }
})();
