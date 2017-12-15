(function() {
    'use strict';



    angular.module('app')
        .controller('ActivitiesCtrl', ['$rootScope', '$state', '$stateParams','$mdToast', '$timeout', '$scope', '$mdEditDialog', '$q', '$http', '$mdDialog', 'api', ActivitiesCtrl])


    function ActivitiesCtrl($rootScope, $state, $stateParams, $mdToast, $timeout, $scope, $mdEditDialog, $q, $http, $mdDialog, api) {



        $scope.addRow = function() {
            $scope.multisearch.push({
                id: $scope.multisearch.length,
                column: "",
                ident: ""
            });
        };
        $scope.deleteRow = function(int) {
            $scope.multisearch.splice(int, 1);
            for (var i = 0; i < $scope.multisearch.length; i++) {
                $scope.multisearch[i].id = i;
            }
            $scope.updateDataTable();
        };


        $scope.resettable = function() {
            $scope.wwstatus = true;
            $scope.datatable = angular.copy(original);
        };
        $scope.updateDataTable = function() {
            $scope.wwstatus = false;
            var filter = false; //set filter false
            for (var j = 0; j < $scope.multisearch.length; j++) {
                if ($scope.multisearch[j].ident && $scope.multisearch[j].column) {
                    filter = true; //if a filter exists

                }
            }
            if (filter) { //if a filter is set
                if (w) {
                    w.terminate();
                }
                w = new Worker("assets/app/core/filter.js");
                w.postMessage({
                    multisearch: $scope.multisearch,
                    datatable: angular.copy(original), //copy the original,
                    smart: $scope.smart
                });
                w.onmessage = function(event) {
                    $scope.datatable = event.data;
                    $scope.wwstatus = true;
                    $scope.$digest();
                };
            } else {
                $scope.wwstatus = true;
                $scope.datatable = angular.copy(original);
            }
        }


        $scope.checkloc = function() {
            if (!$scope.data.loc_lat && !$scope.data.loc_lng) {

                $mdDialog.show(
                    $mdDialog.alert()
                    .title('Check Map Location').ok('OK')
                );

                return true;
            }
        }



        $scope.closeform = function(data) {

                data = data || 0;
                
            $scope.formmode('close', data);

        }

        $scope.addbtn = function() {
            $scope.formmode('add');

        }

        $scope.submit_form = function() {

            $scope.data_form.$setSubmitted();
            $scope.add_data();
        }


        $scope.view = function(id) {

            $state.go('admin.devview', { id: api.encode(id) });
        }


        $scope.formmode = function(type, data = 0) {


            var ev = '';



            if ($scope.data_form.$dirty && data == 0) {

                var confirm = $mdDialog.confirm()
                    .title('You will lose unsaved changes if you do this action ?')
                    .targetEvent(ev)
                    .ok('OK, Do it')
                    .cancel('Cancel');
                $mdDialog.show(confirm).then(function() {


                    $scope.reset();

                    if (type === 'update') {

                        $scope.showform = true;
                        $scope.add = false;
                    } else if (type === 'add') {

                        $scope.showform = true;
                        $scope.add = true;
                    } else {

                        $scope.showform = false;
                        $scope.add = true;
                    }


                    return;

                }, function() {

                    return;

                });

            } else {
                $scope.reset();

                if (type === 'update') {

                    $scope.showform = true;
                    $scope.add = false;
                } else if (type === 'add') {

                    $scope.showform = true;
                    $scope.add = true;
                } else {

                    $scope.showform = false;
                    $scope.add = true;
                }
            }





        };


        $scope.title = 'Activity';
        $scope.apipath = api.base +'activity/';
        $scope.showform = false;
        $scope.add = true;
        $scope.data = {};
        $scope.activefilter = false;
        $scope.showsearch = false;
        var w;

        var original;
        $scope.smart = true;
        $scope.wwstatus = true;

        $scope.datatable = {};
        $scope.datatable.data = [];

        $scope.data.loc_lat = 0;
        $scope.data.loc_lng = 0;
        $scope.users = [];
        $scope.temp = api.users();
        $scope.temp().then().then(function(data) {
            $scope.users = data.data;
        });
        $scope.mapzoom = 12;
        $scope.limitOptions = [5, 10, 15, 20, 25, 50, 100];
        $scope.options = {
            limitSelect: true,
            pageSelect: true,
            boundaryLinks: true
        };
        $scope.query = {
            order: 'name',
            limit: 10,
            page: 1
        };

        $scope.autocolumn = [{
                name: "name",
                display: "Name"
            }, {
                name: "desc",
                display: "Description"
            }


        ];

        $scope.multisearch = Array();
        $scope.multisearch[0] = {
            id: 0,
            column: "",
            ident: "",
        };


        $scope.reset = function() {


            if ($scope.lfApi) {
                $scope.lfApi.removeAll()
            }
            $scope.data_form.$setPristine();
            $scope.data_form.$setUntouched();
            $scope.data = {};
            $scope.data.loc_lat = 0;
            $scope.data.loc_lng = 0;
            $scope.data.uploads = [];
            $scope.files = [];
            $scope.isFilesNull = true;
            $scope.mapzoom = 12;


        };




        $scope.toggleLimitOptions = function() {
            $scope.limitOptions = $scope.limitOptions ? undefined : globalapp.pagenation;
        };



        $scope.update = function() {




                $http.put($scope.apipath + $scope.data.id, { data: $scope.data })
                    .then(
                        function(response) {

                              var res = angular.fromJson(response) 
                               console.log(res.data);

                            if (res.data.status == 'ok') {

                                $scope.closeform(1);


                                $mdDialog.show(
                                    $mdDialog.alert()
                                    .title($scope.title + '  Info Updated').ok('OK')
                                );

        

                                $scope.loaddata();


                            } else {

                                $mdDialog.show(
                                    $mdDialog.alert()
                                    .title(res.data.data).ok('OK')
                                );


                            }
                        }

                    );

      


        }




        $scope.add_data = function() {

            if ($scope.data_form.$invalid) {

                return;
            }
            if ($scope.add == false) {

                $scope.update();

                return;
            }


                $http.post($scope.apipath, { data: $scope.data })
                    .then(
                        function(response) {

                            var res = angular.fromJson(response);


                            if (res.data.status == 'ok') {

                                $scope.closeform(1);



                                $mdDialog.show(
                                    $mdDialog.alert()
                                    .title('New ' + $scope.title + ' Added').ok('OK')
                                );

                                $scope.files = [];

                                $scope.loaddata();


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






        $scope.delete = function(dataid, ev) {


            var confirm = $mdDialog.confirm()
                .title('Are you sure to delete this  ' + $scope.title + ' ?')
                .targetEvent(ev)
                .ok('Yes, Delete')
                .cancel('Cancel');
            $mdDialog.show(confirm).then(function() {


                $http.delete($scope.apipath + dataid)
                    .then(
                        function(response) {

                            if(response.data.status == 'ok')
                            {

                            $mdToast.show(
      $mdToast.simple()
        .textContent($scope.title + ' Deleted')
        .position('top right')
        .hideDelay(3000)
    );
                            $scope.loaddata();
                        }
                        else
                        {
                               $mdToast.show(
      $mdToast.simple()
        .textContent(response.data.data)
        .position('top right')
        .hideDelay(3000)
    );
                        }

                        });


            }, function() {});




        }




        $scope.update_info = function(dataid) {


            $scope.formmode('update');

            $http.get($scope.apipath + dataid)
                .then(
                    function(response) {

                        var res = angular.fromJson(response);



                        if (res.data.status == 'ok') {


                            $scope.data = res.data.data;


                        } else {


                        }
                    },
                    function(response) {
                        // failure call back
                    }
                );



        }





        $scope.loaddata = function() {
            $http.get($scope.apipath)
                .then(
                    function(response) {

                        var res = angular.fromJson(response);

                        if (res.data.status == 'ok') {


                            $scope.datatable.data = res.data.data;
                            original = res.data;



                        } else {


                        }
                    },
                    function(response) {
                        // failure call back
                    }
                );
        }

        $scope.loaddata();


        $scope.$on('$viewContentLoaded', function() {

            if ($stateParams.mode == 'edit' && $stateParams.data != null) {
                (function() {}, 10);
                $scope.update_info(api.decode($stateParams.data));
            } else if ($stateParams.mode == 'delete' && $stateParams.data != null) {
                $scope.delete(api.decode($stateParams.data));
            } else {

            }

        })



    }
})();
