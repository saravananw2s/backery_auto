(function() {
        'use strict';
        angular.module('app').controller('ReportCtrl', ['$rootScope', '$state', '$stateParams', '$mdToast', '$timeout', '$scope', '$mdEditDialog', '$q', '$http', '$mdDialog', 'api', ReportCtrl])

        function ReportCtrl($rootScope, $state, $stateParams, $mdToast, $timeout, $scope, $mdEditDialog, $q, $http, $mdDialog, api) {

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
                    $scope.loaddata();
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

            $scope.showform = false;
            $scope.add = true;
            $scope.data = {};
            $scope.activefilter = false;
            $scope.showsearch = false;

            var w;
            var original;
            var old = [];
            $scope.smart = true;
            $scope.wwstatus = true;
            $scope.datatable = {};
            $scope.datatable.data = [];

            $scope.limitOptions = [5, 10, 15, 20, 25, 50, 100];
            $scope.options = {
                limitSelect: true,
                pageSelect: true,
                boundaryLinks: true
            };

            $scope.multisearch = Array();
            $scope.multisearch[0] = {
                id: 0,
                column: "",
                ident: "",
            };





        $scope.datePicker = {
            startDate: new Date(),
            endDate: new Date()
        };



        $scope.query = {
            order: 'schedule_date_time',
            limit: 10,
            page: 1
        };
        $scope.autocolumn = [{
            name: "schedule_date_time",
            display: "Scheduled"
        }, {
            name: "allocated_emp",
            display: "Employee"
        }, {
            name: "cust_name",
            display: "Customer"
         }
        ,{
            name: "timestamps",
            display: "Delivered"
        } ,{
            name: "status",
            display: "Status"
        }];

      $scope.temp = api.users();
        $scope.temp().then().then(function(data) {
            $scope.users = data.data;
        });
 $scope.filterData = function() {


            if ($scope.data_form.$valid) {


            $http.post('location_emp_api/' + $scope.emp_id, {
                data: {

                    start_date: moment($scope.datePicker.startDate).format('YYYY-MM-DD'),
                    end_date: moment($scope.datePicker.endDate).format('YYYY-MM-DD'),
                    emp_id: $scope.emp_id
                }
            }).success(function(response) {


                    var temp = [];

                    angular.forEach(response.data.visit_list, function(value, key){

                        temp.push(value.task)

                    });
console.log(temp)


                    $scope.datatable.data = temp;
                    original = {};
                    original.data = temp;
                             $scope.data = temp;




            });

        }
        }
                }
            })();
