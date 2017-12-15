(function() {
    'use strict';
    angular.module('app').controller('DashboardCtrl', ['$scope', '$state', '$mdEditDialog', '$q', '$timeout', '$http', '$mdDialog', 'api', DashboardCtrl])

    function DashboardCtrl($scope, $state, $mdEditDialog, $q, $timeout, $http, $mdDialog, api) {
        function DialogController($scope, $mdDialog, dataToPass, api,$window, $mdSelect) {

            //  $window.addEventListener('click',function(e){

            //     console.log(e);

            //  $mdSelect.hide();
            // })
            $scope.passed = dataToPass;
            if (!dataToPass.data) {
                $scope.data = {};
                $scope.add = true;
                $scope.data.status = 'Unallocated';
                $scope.data.type = 0;
                $scope.data.method = 'Pickup';
                $scope.datePicker = new Date()
                $scope.data.loc_lat = 0;
                $scope.data.loc_lng = 0;
                $scope.edit = true;
            } else {
                $scope.edit = false;
                $scope.data = dataToPass.data;
                $scope.data.type = 0;
                $scope.add = false;
                $scope.datePicker = moment($scope.data.schedule_date_time)._d;
                if ($scope.data.allocated_emp_id) {
                    $scope.data.emp = $scope.data.allocated_emp_id;
                }
            }


            $scope.edit = true;


            if($scope.passed.dataView)
            {

                    $scope.edit = false;
                    $scope.data = dataToPass.data;
            }


            $scope.apipath = 'new_task/';
            $scope.temp = api.users();
            $scope.temp().then().then(function(data) {
                $scope.users = data.data;
            });
            $scope.alert = '';
            $scope.showmap = false;
            $scope.mapzoom = 18;
            $scope.customers = [];
            $scope.schedule = api.schedule;
            $scope.tempcus = api.customers();
            $scope.place_type = api.place_type;
            $scope.method = api.method;
            $scope.email_rex = api.email_rex;
            $scope.web_rex = api.web_rex;
            $scope.tempcus().then().then(function(data) {
                $scope.customers = data.data;
            });
            $scope.dateCheck = function() {
                if ($scope.datePicker._i.length == 13) {
                    console.log('Date only');
                }
            }
            $scope.customersChange = function() {
                var index = _.findIndex($scope.customers, function(item) {
                    return item.id == $scope.data.cust_id
                })
                var choosenCustomer = $scope.customers[index];
                if (choosenCustomer) {
                    $scope.data.cust_phone = choosenCustomer.contact_no;
                    $scope.data.cust_email = choosenCustomer.email;
                    $scope.data.cust_name = '';
                    $scope.data.cust_address = choosenCustomer.address;
                    $scope.data.loc_lat = choosenCustomer.loc_lat;
                    $scope.data.loc_lng = choosenCustomer.loc_lng;
                }
            }
            $scope.emptyCustomerInfo = function(id) {
                $scope.data.cust_phone = '';
                $scope.data.cust_email = '';
                $scope.data.cust_name = '';
                $scope.data.cust_address = '';
                $scope.data.loc_lat = 0;
                $scope.data.loc_lng = 0;
                $scope.data.cust_id = '';
            };
            $scope.geocodeupdateloc1 = function() {
                var address = $scope.data.cust_address;
                if (address) {
                    var geocoder = new google.maps.Geocoder();
                    geocoder.geocode({
                        "address": address
                    }, function(results, status) {
                        if (status == google.maps.GeocoderStatus.OK && results.length > 0) {
                            var location = results[0].geometry.location;
                            $scope.getpos(location);
                        } else {}
                    });
                }
            }
            $scope.getpos = function(data, zoom = 18) {
                $scope.data.loc_lat = data.lat();
                $scope.data.loc_lng = data.lng();
                $scope.mapzoom = zoom;
                $timeout(function() {
                    $scope.$apply();
                }, 0);
            };
            $scope.submit_form = function() {
                if ($scope.data_form1.$invalid) {
                    return;
                }
                if ($scope.data.loc_lat == 0 || $scope.data.loc_lng == 0) {
                    $scope.alert = 'Address Lat Lang Invalid';
                    return;
                }

                // if ($scope.datePicker._i.length == 13) {
                //                $scope.alert = 'Date time Invalid';
                // }


                console.log($scope.datePicker);
                $scope.data.schedule_date_time = api.CovertDateTime($scope.datePicker);
                if ($scope.add == true) {
                    $http.post($scope.apipath, {
                        data: $scope.data
                    }).then(function(response) {
                        var res = angular.fromJson(response);
                        if (res.data.status == 'ok') {
                            $mdDialog.hide('reload');
                            $mdDialog.show($mdDialog.alert().title(res.data.data).ok('OK'));
                            // setTimeout($scope.cancel(), 2000)
                        } else {
                            $scope.alert = res.data.data;
                        }
                    }, function(response) {
                        // failure call back
                    });
                } else {
                    $http.put($scope.apipath + $scope.data.id, {
                        data: $scope.data
                    }).then(function(response) {
                        var res = angular.fromJson(response);
                        if (res.data.status == 'ok') {
                            //   $scope.alert = res.data.data;
                            $mdDialog.hide('reload');
                            $mdDialog.show($mdDialog.alert().title(res.data.data).ok('OK'));
                            //setTimeout($scope.cancel(), 2000)
                        } else {
                            $scope.alert = res.data.data;
                        }
                    }, function(response) {
                        // failure call back
                    });
                }
                console.log($scope.data);
            };
            $scope.hide = function() {
                $mdDialog.hide();
            };
            $scope.cancel = function() {
                $mdDialog.cancel();
            };
        }
        $scope.showTabDialog = function(ev, add, id) {
            var add = add || true;
            if (add == true) {
                var data = false;
                $mdDialog.show({
                    controller: DialogController,
                    locals: {
                        dataToPass: data
                    },
                    templateUrl: 'assets/app/new-schedule/modal_view.html?' + Math.random(),
                    targetEvent: ev,
                    clickOutsideToClose: false
                }).then(function(answer) {
                    if (answer == 'reload') {
                        $scope.updateData();
                    }
                }, function() {});
                }
                else if (add == 11) {
                                var data = {
                                    'dataView' : true,
                                    'data' : id
                                };
                $mdDialog.show({
                    controller: DialogController,
                    locals: {
                        dataToPass: data
                    },
                    templateUrl: 'assets/app/new-schedule/modal_view.html?' + Math.random(),
                    targetEvent: ev,
                    clickOutsideToClose: false
                }).then(function(answer) {
                    if (answer == 'reload') {
                        $scope.updateData();
                    }
                }, function() {});

                }
            else {
                $http.get('new_task/' + id).then(function(data) {
                    var data = data.data;
                    $mdDialog.show({
                        controller: DialogController,
                        locals: {
                            dataToPass: data
                        },
                        templateUrl: 'assets/app/new-schedule/modal_view.html?' + Math.random(),
                        targetEvent: ev,
                        clickOutsideToClose: false
                    }).then(function(answer) {
                        if (answer == 'reload') {
                            $scope.updateData();
                        }
                    }, function() {});
                });
            }
        };
        $scope.customers = [];
        $scope.users = [];
        $scope.tasksData = {};
        $scope.tasksData.data = [];
        $scope.task = {};
        $scope.cust_id = '';
        $scope.task.expanded = true;
        $scope.showTrafficLayer = false;
        $scope.taskFilter = '';
        $scope.taskFilterSt = false;
        $scope.DriverFilter = '';
        $scope.DriverFilterSt = false;
        $scope.RouteOrigin = api.mapcenter;
        $scope.SideBar = true;
        $scope.trackingMap = true;
        $scope.date = new Date();
        $scope.apipath = 'new_task/';
        $scope.driverDefaultImg = 'assets/images/canva-man-delivering-boxes-on-scooter-icon-MAB60VR-Abk.png';
        $scope.updateData = function() {
            $scope.tempcus = api.customers();
            $scope.tempcus().then().then(function(data) {
                $scope.customers = data.data;
            });
            $scope.tempusers = api.users();
            $scope.tempusers().then().then(function(data) {
                $scope.users = data.data;
            });
            var tepDate = moment($scope.date).format('YYYY-MM-DD');
            $http.get($scope.apipath + '?date=' + tepDate).then(function(response) {
                var res = angular.fromJson(response);
                if (res.data.status == 'ok') {
                    $scope.tasksData.data = res.data.data;
                } else {}
            }, function(response) {
                // failure call back
            });
            if ($scope.TaskView) {
                if ($scope.TaskView.id) {
                    $http.get($scope.apipath + $scope.TaskView.id).then(function(response) {
                        var res = angular.fromJson(response);
                        if (res.data.status == 'ok') {
                            $scope.ToggleTrackingView(res.data.data, 'update');
                        } else {}
                    }, function(response) {
                        // failure call back
                    });
                }
            }
        }
        $scope.parseJsonProfile = function(data) {
            if (data) {
                data = angular.fromJson(data);
                if (data.length) {
                    return data[0];
                }
            }
            return $scope.driverDefaultImg;
        }
        $scope.updateData();
        $scope.task_info = function(data) {
            var info = '<p>ID :#' + data.id + '</p> ' +  '<p>Name :' + data.cust_name + '</p> ' + '<p>Items :' + data.notes + ' ' + '</p> ' + '<p>Status :' + ' ' + data.status + '</p> ';
            if (data.timestamps) {
                info = info + '<p>  Delivered - Date / Time  : ' + data.timestamps + ' </p>';
            }
            if (data.allocated_emp) {
                info = info + '<p>  Delivery Agent : ' + data.allocated_emp + ' </p>';
            }
            return info;
        }
        $scope.RouteDraw = function(data) {
            if (data.allocated_emp) {
                var index = _.findIndex($scope.onlineemp, function(item) {
                    return item.user_id == data.allocated_emp
                })
                if (index > -1) {
                    $scope.RouteDestination = [data.loc_lat, data.loc_lng];
                    $scope.RouteOrigin = [lat, lng];
                    $scope.$apply();
                }
            }
        }
        $scope.emp_info = function($data) {
            var info = '<p>Emp id :' + $data['user']['user_id'] + '</p> ' + '<p>Name :' + $data['user']['last_name'] + ' ' + $data['user']['first_name'] + '</p> ' + '<p> Active : ' + api.timeago($data['timestamp']) + ' </p>';
            return info;
        }
        $scope.GetIcons = function(status) {
            if (status == "Unallocated") {
                return '/assets/images/Unallocated.png';
            } else if (status == "Allocated") {
                return '/assets/images/Allocated.png';
            } else if (status == "In-Progress") {
                return '/assets/images/On-Progress.png';
            } else if (status == "Incomplete") {
                return '/assets/images/Delivered.png';
            }

            // else if (status == "Completed") {
            //     return '/assets/images/Home.png';
            // }
            else if (status == "Delivered") {
                return '/assets/images/Delivered.png';
            }            else if (status == "Canceled") {
                return '/assets/images/Canceled.png';
            }
             else {
                return '/assets/images/Home.png';
            }
        }
        $scope.GetEmpIcons = function(emp) {
            // return 'https://openclipart.org/image/2400px/svg_to_png/203366/top-down-bike-racing-monsterbraingames.png'
            var name = 'Offline';



            if (emp) {
                if (emp.user_id) {
                    var status = $scope.getEmpStatusCheck(emp.user_id);
                    if (status == "Free") {
                        var name = 'Free';
                    } else if (status.indexOf("Busy") >= 0) {
                        var name = 'Busy';
                    } else {
                        var name = 'Offline';
                    }
                    if (emp.compass_direction) {
                        if (emp.compass_direction <= 180) {
                            return 'assets/images/' + name + '_left.png';
                        } else {
                            return 'assets/images/' + name + '_right.png';
                        }
                    } else {
                        return 'assets/images/' + name + '_right.png';
                    }
                }
            }
            return 'assets/images/' + name + '_right.png';
        }
        $scope.taskStatus = function() {
            if ($scope.taskFilter == '') {
                $scope.taskFilterSt = false;
            }
        }
        $scope.mapcenter = api.mapcenter;
        $scope.schedule_status = angular.copy(api.schedule);
        $scope.address = '';
        $scope.schedule_status.unshift('');
        $scope.zoom = 18;
        $scope.mapshow = true;
        $scope.pan = function(task, type) {
            var type = type || 0;
            if (task && type == 'task') {
                $scope.mapcenter = [task.loc_lat, task.loc_lng];
                $scope.zoom = 18;
                $scope.RouteDraw(task);
            }
        }
        $scope.DriverFilterStatus = function() {
            if ($scope.DriverFilterV == 'All') {
                $scope.DriverFilterSt = false;
                $scope.DriverFilter = '';
            }
            if ($scope.DriverFilterV == 'Busy') {
                $scope.DriverFilterSt = true;
                $scope.DriverFilter = 'Busy';
            }
            if ($scope.DriverFilterV == 'Free') {
                $scope.DriverFilterSt = true;
                $scope.DriverFilter = 'Free';
            }
        }
        $scope.DriverGPSFilterStatus = function() {
            // if($scope.DriverGPSFilterV == 'All')
            // {
            //      $scope.DriverGPSFilter='';
            // }
            // if($scope.DriverGPSFilterV == 'Online')
            // {
            //      $scope.DriverGPSFilter='Online';
            // }
            // if($scope.DriverGPSFilterV == 'Offline')
            // {
            //      $scope.DriverGPSFilter='Offline';
            // }
            // if($scope.DriverGPSFilterV == 'Inactive')
            // {
            //      $scope.DriverGPSFilter='Inactive';
            // }
        }


        $scope.GetSpeedStatus = function(user_id)
        {
             if ($scope.onlineemp) {
                var data = _.find($scope.onlineemp, function(item) {
                    if (item.user_id == user_id) {
                        return true;
                    } else {
                        return false;
                    }
                })

                if (data) {

                    if(data.speed)
                    {
                        if(Math)
                        {
                           data.speed = Math.round( data.speed);
                        }
                        else
                        {

                        }
                        return data.speed + ' kph';
                    }
                    else
                    {
                        return  'No Data';
                    }
                }
                else
                {
                     return  'No Data';
                }

            }
            else
            {
               return  'No Data';
            }
        }

        $scope.GetBatteryStatus = function(user_id)
        {
             if ($scope.onlineemp) {
                var data = _.find($scope.onlineemp, function(item) {
                                  if (item.user_id == user_id) {
                        return true;
                    } else {
                        return false;
                    }
                })

                if (data) {

                    if(data.battery_status)
                    {
                         return data.battery_status + '%';
                    }
                    else
                    {
                        return  'No Data';
                    }
                }
                else
                {
                     return  'No Data';
                }

            }
            else
            {
               return  'No Data';
            }
        }

        $scope.MobileLast = function(data)
        {
            if(data == 'Active')
            {

              return '#256725';
            }
            else if(data == 'In Active')
            {
                   return '#2e43ff';
            }
            else
            {
                      return '#693f3f';
            }


        }
        $scope.getLastActivity = function(e, color, timestamp) {
            var color = color || false;
            var timestamp = timestamp || false;
            if ($scope.onlineemp) {
                var data = _.find($scope.onlineemp, function(item) {
                    if (item.user_id == e) {
                        return true;
                    } else {
                        return false;
                    }
                })
                if (data) {
                    if (timestamp) {
                        return api.onlineTimeAgo(data.timestamp);
                    }
                    var check = new Date(data.timestamp);
                    var now = moment(new Date());
                    if (moment(check).format("YYYY-MM-DD") == moment().format("YYYY-MM-DD")) {
                        var diffmm = now.diff(check, 'minutes');
                        // .format("mm");
                        if (parseInt(diffmm) < 10 && parseInt(diffmm) > 0) {
                            if (color) {
                                return '#256725';
                            } else {
                                return "Online";
                            }
                        } else {
                            if (color) {
                                return '#2e43ff';
                            } else {
                                return "Inactive";
                            }
                        }
                    } else {
                        if (color) {
                            return '#693f3f';
                        } else {
                              return "No Data";
                        }
                    }
                }
            }
            if (color) {
                return '#693f3f';
            } else {
                return "No Data";
            }
        }
        // $scope.getEmpStatusCheck
        $scope.criteriaMatch = function(criteria) {
            return function(item) {
                var status = $scope.getEmpStatusCheck(item.user_id);
                if ($scope.DriverFilter == 'Busy' && status == 'Busy') {
                    return true;
                } else if ($scope.DriverFilter == 'Free' && status == 'Free') {
                    return true;
                } else if ($scope.DriverFilter == '') {
                    return true;
                } else {
                    return false;
                }
            };
        };
        $scope.criteriaMatchGPS = function(criteria) {
            return function(item) {
                // var status = $scope.getLastActivity(item.user_id);

                if($scope.DriverGPSFilterV == item.activity)
                {
                    return true;
                }
               else if ($scope.DriverGPSFilterV == 'All') {
                    return true;
                } else {
                    return false;
                }

                // if ($scope.DriverGPSFilterV == 'Active' && status == 'Active') {
                //     return true;
                // } else if ($scope.DriverGPSFilterV == 'In Active' && status == 'Inactive') {
                //     return true;
                // } else if ($scope.DriverGPSFilterV == 'Offline' && status == 'No Data') {
                //     return true;
                // } else if ($scope.DriverGPSFilterV == 'All') {
                //     return true;
                // } else {
                //     return false;
                // }
            };
        };
        $scope.TaskStatusColor = function(status) {
            if (status == "Unallocated") {
                return "#00a8cc";
            } else if (status == "Allocated") {
                return "#00316b";
            } else if (status == "In-Progress") {
                return "Green";
            } else if (status == "Incomplete") {
                return "#924324";
            } else if (status == "Delivered") {
                return "#8c8181";
            } else if (status == "Canceled") {
                return "#c90505";
            } else {
                return "#4f4f9c";
            }
        }
        $scope.getEmpStatusCheck = function(e, JobOnly) {
            var JobOnly = JobOnly || false;
            if ($scope.tasksData.data) {
                var tasks = 0;
                var data = _.find($scope.tasksData.data, function(item) {
                    if ((item.allocated_emp_id == e) && (item.status == 'In-Progress' || item.status == 'Allocated')) {
                        return true;
                    } else {
                        return false;
                    }
                })
                if (data) {
                    if (JobOnly) {

                     angular.forEach($scope.tasksData.data, function(item,index) {
                            if ((item.allocated_emp_id == e) && (item.status == 'In-Progress' || item.status == 'Allocated')) {
                             tasks++;
                            }
                        });


                        return '(' + tasks + ' Task)';
                    }
                    return 'Busy';
                }
            }
            if (JobOnly) {
                return '';
            }
            return 'Free';
        }
        // $scope.driverBusy = false;
        // $scope.driverFree = false;
        // $scope.driverAll = true;
        // $scope.filterEmpStatus = function(val) {
        //     if (val == 1) {
        //         $scope.driverFree = false;
        //         $scope.driverBusy = false;
        //     } else if (val == 2) {
        //         $scope.driverAll = false;
        //         $scope.driverBusy = false;
        //     } else if (val == 3) {
        //         $scope.driverFree = false;
        //         $scope.driverAll = false;
        //     } else {}
        // };
        if (api.manager()) {
            $scope.user_id = '';
            $scope.profile = api.profile();
            $scope.profile().then().then(function(data) {
                $scope.user_id = data.data.user_id;
                var geocoder = new google.maps.Geocoder();
                geocoder.geocode({
                    "address": data.data.street
                }, function(results, status) {
                    if (status == google.maps.GeocoderStatus.OK && results.length > 0) {
                        var location = results[0].geometry.location;
                        $scope.mapcenter = location;
                        $scope.zoom = 20;
                        $scope.$apply();
                        // $scope.getpos(location);
                    } else {}
                });
                window.Echo.private(globalapp.channel + 'user-' + $scope.user_id)
                .listen('LocationUpdate', (e) => {
                    var index = _.findIndex($scope.onlineemp, function(item) {
                        return item.user_id == e.data.user_id
                    })

                    var index1 = _.findIndex($scope.users, function(item) {
                        return item.user_id == e.data.user.user_id
                    })


                    if (index1 > -1) {

                              $scope.users[index1] = e.data.user;

                    }
                    if (index > -1) {
                        $scope.onlineemp[index] = e.data;


                    } else {
                        $scope.onlineemp.push(e.data);
                    }
                    $scope.$apply();
                })
                     .listen('TaskUpdateEvent', (e) => {

                        if(e.data)
                        {

                    var index1 = _.findIndex($scope.tasksData.data , function(item) {
                        return item.id == e.data.id;
                    })

                    if (index1 > -1) {

                              $scope.tasksData.data[index1] = e.data;
                               $scope.$apply();
                    }
                        }


                     })
                ;
            });
        } else {
            if (api.superAdmin()) {
                var domain = api.getSubDomain() + '-';
            } else {
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

        function GetOnlineEmp() {
            if ($state.current.name == 'admin.company_dashboard') {
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
            GetOnlineEmp();
        })
        $scope.geocodeupdateloc = function() {
            if ($scope.address) {
                var geocoder = new google.maps.Geocoder();
                geocoder.geocode({
                    "address": $scope.address
                }, function(results, status) {

                    if (status == google.maps.GeocoderStatus.OK && results.length > 0) {
                        var location = results[0].geometry.location;
                        $scope.mapcenter = location;
                        $scope.zoom = 20;

                        $timeout(function() { $scope.$apply(); }, 10);
                       // $scope.getpos(location);
                    } else {}
                });
            }
        }
        $scope.ToggleTrackingViewStatus = false;
        $scope.ToggleDefault = function() {
            $scope.ToggleTrackingViewZoom = 20;
            $scope.ToggleTrackingViewCenter = api.mapcenter;
            $scope.ToggleTrackingType = '';
            $scope.ToggleTrackingViewCust = {};
            $scope.ToggleRouteDestination = 'London';
            $scope.ToggleRouteOrigin = 'London';
            $scope.ToggleRouteStatus = false;
            $scope.ToggleTrackingViewSingleEmp = false;
            $scope.ToggleTrackingShowRedraw = false;
            $scope.ToggleGPSData = false;
            $scope.TaskViewEmp_id = '';
            $scope.taskGeoData = [];
            $scope.TaskView = [];
          $scope.TripGeoData = [];
            $scope.TaskViewList = [];
            $scope.TaskSelect = '';

             $scope.TripDuration = '';
             $scope.TripKMS  = '';

              $scope.taskStart = '';
              $scope.taskEnd = '';

                                       $scope.TripGeoSegmentsData  = [];
                                       $scope.TripGeoSegments  = [];
                                       $scope.TripGeoDataStart  = [];
                                       $scope.TripGeoDataStop  = [];

$scope.TripStared = [];
            $scope.ToggleTrackingViewShowAllEmp = false;
            $scope.ToggleTrackingViewCust.lat = $scope.ToggleTrackingViewCenter[0];
            $scope.ToggleTrackingViewCust.lng = $scope.ToggleTrackingViewCenter[1];
            if (angular.element("#panelId")[0]) {
                angular.element("#panelId")[0].innerHTML = '';
            }
            $scope.ToggleTrackingViewCust = [];
            $scope.ToggleTrackingViewCustSt = false;
        }
        $scope.ToggleDefault();
        $scope.allocatedTask = function(emp) {

            if(!emp)
            {
                return;
            }
            var status = 'Allocated';
            var emp = emp;
            var taskId = $scope.TaskView.id;
            var data = {
                "status": status,
                "emp": emp
            };
            $http.post('allocateTask/' + taskId, {
                data: data
            }).then(function(response) {
                var res = angular.fromJson(response);
                if (res.data.status == 'ok') {
                    $scope.TaskView = res.data.data;
                    $mdDialog.hide('reload');
                    $mdDialog.show($mdDialog.alert().title('Task Allocated').ok('OK'));
                    $scope.updateData();
                } else {
                    $scope.alert = res.data.data;
                }
            }, function(response) {});
        }

        $scope.ToggleTrackingRedraw = function()
        {

            $scope.ToggleRouteStatus = false;

                             if (angular.element("#panelId")[0]) {
                    angular.element("#panelId")[0].innerHTML = '';
                }
            $timeout(
                function()
                {


                    $scope.$apply();
                      $scope.ToggleRouteStatus = true;
                },
                200
            );


            //      $scope.ToggleRouteStatus = false;
            //                  if (angular.element("#panelId")[0]) {
            //         angular.element("#panelId")[0].innerHTML = '';
            //     }


            //              var index = _.findIndex($scope.onlineemp, function(item) {
            //                         return item.user_id == $scope.TaskViewEmp_id;
            //                     });
            //                      if (index > -1) {

            //                         $scope.ToggleRouteOrigin = [$scope.onlineemp[index].lat, $scope.onlineemp[index].lng];
            //                         $scope.ToggleRouteStatus = true;
            //                     }



            //
             }
        $scope.ToggleTrackingViewDrawDirection = function(data) {

            if ($scope.TaskView.status == 'Unallocated' && $scope.ToggleRouteStatus == false) {

                if(!data.user_id)
                {
                       if ($scope.onlineemp) {
                var data = _.find($scope.onlineemp, function(item) {
                                  if (item.user_id == data) {
                        return true;
                    } else {
                        return false;
                    }
                })
                    if(!data)
                    {
                        return;
                    }
                }
              }

                           if (angular.element("#panelId")[0]) {
                  angular.element("#panelId")[0].innerHTML = '';
              }
                $scope.ToggleRouteOrigin = [data.lat, data.lng];
                $scope.TaskViewEmp_id = data.user_id;
                $scope.ToggleRouteDestination = [$scope.TaskView.loc_lat, $scope.TaskView.loc_lng];
                $scope.ToggleRouteStatus = true;
            } else {

                             if (angular.element("#panelId")[0]) {
                    angular.element("#panelId")[0].innerHTML = '';
                }
                $scope.ToggleRouteStatus = false;
            }
        }

        $scope.ToggleTrackingView = function(data, type) {
            var data = data || '';
            var type = type || '';
            $scope.ToggleDefault();

            // $scope.updateData();
            $scope.ToggleTrackingType = type;
            $scope.ToggleTrackingViewCenter = $scope.mapcenter;
            if (type == 'update') {
                $scope.ToggleTrackingViewStatus = false;
                $scope.ToggleTrackingType = 'task';
            }


            if($scope.ToggleTrackingType == 'emp')
            {

                            $scope.ToggleTrackingViewCust.lat = $scope.mapcenter[0];
                            $scope.ToggleTrackingViewCust.lng = $scope.mapcenter[1];



            }



            if($scope.ToggleTrackingType == 'task')
            {
                $scope.TaskView = data;
            }
            else if($scope.ToggleTrackingType == 'emp')
            {
                $scope.TaskViewEmp_id = data.user_id;
                $scope.TaskSelect = 'All';



                angular.forEach($scope.tasksData.data, function(item,index) {
                       if ((item.allocated_emp_id ==  $scope.TaskViewEmp_id)) {

                $scope.TaskViewList.push(item);
                       }
                   });


                            var tepDate = moment($scope.date).format('YYYY-MM-DD');


                    $http.get('getMyLocations?date='+tepDate+'&emp='+$scope.TaskViewEmp_id).then(function(data)
                    {
           $scope.TripKMS = data.data.data.distance;
                                       $scope.TripDuration  = data.data.data.time_taken;
                                       $scope.TripGeoData  = data.data.data.geoData;


                                       $scope.TripGeoSegmentsData  = [];
                                       $scope.TripGeoSegments = [];
                                       $scope.TripGeoDataStart  = [];
                                       $scope.TripGeoDataStop  = [];

                                    if($scope.TripGeoData.length > 0)
                                       {



                                        for (var i = 0 ; i <= $scope.TripGeoData.length - 1; i++) {


                                            if($scope.TripGeoData[i]['activity'] == 'Start')
                                            {
                                                $scope.TripGeoDataStart.push([$scope.TripGeoData[i]['lat'],$scope.TripGeoData[i]['lng']]);
                                            }

                                            if($scope.TripGeoData[i]['activity'] == 'Stop')
                                            {
                                                 $scope.TripGeoDataStop.push([$scope.TripGeoData[i]['lat'],$scope.TripGeoData[i]['lng']]);

                                            }

                                            if($scope.TripGeoData[i]['activity'] == 'Start')
                                            {
                                                       $scope.TripGeoSegments.push($scope.TripGeoSegmentsData);

                                                       $scope.TripGeoSegmentsData = [];
                                                     $scope.TripGeoSegmentsData.push([$scope.TripGeoData[i]['lat'],$scope.TripGeoData[i]['lng']]);



                                            }
                                            else
                                            {
                                             $scope.TripGeoSegmentsData.push([$scope.TripGeoData[i]['lat'],$scope.TripGeoData[i]['lng']]);

                                            }


                                        }

                                        }


                                        if($scope.TripGeoSegmentsData.length > -1)
                                        {


                                                     $scope.TripGeoSegments.push($scope.TripGeoSegmentsData);

                                                       $scope.TripGeoSegmentsData = [];
                                        }


                                       if($scope.TripGeoData[0])
                                       {

                                            $scope.mapcenter = [$scope.TripGeoData[0].lat,$scope.TripGeoData[0].lng];
                                            $scope.TripStared = [$scope.TripGeoData[0].lat,$scope.TripGeoData[0].lng];


                                       }


                                        $timeout(function() {$scope.$apply();}, 100);


                    })




            }
            else
            {

            }

            if ($scope.ToggleTrackingViewStatus) {
                $scope.SideBar = true;
                $scope.trackingMap = true;
                $scope.ToggleTrackingViewStatus = false;
            } else {
                $scope.SideBar = false;
                $scope.trackingMap = false;
                $scope.ToggleTrackingViewStatus = true;
                if ($scope.ToggleTrackingType == 'task') {

                     $scope.loadTaskData(data)

                }
            }
        }

        $scope.empLoadTask = function(id)
        {



            var data = {};

                angular.forEach($scope.TaskViewList, function(item,index) {
                       if ((item.id ==  id)) {


                        data = item;


                       }
                   });






            $scope.TaskView = data;



           $scope.loadTaskData(data);
        }


        $scope.loadTaskData = function(data)
        {
                                if (data.allocated_emp) {
                        if ((data.allocated_emp_id) && (data.status == 'In-Progress' || data.status == 'Allocated')) {
                            // star Tracking view
                            $scope.ToggleTrackingViewCenter = [data.loc_lat, data.loc_lng];
                            $scope.ToggleTrackingViewCust.lat = data.loc_lat;
                            $scope.ToggleTrackingViewCust.lng = data.loc_lng;
                            $scope.ToggleTrackingViewShowAllEmp = false;
                            $scope.ToggleTrackingViewSingleEmp = true;
                            $scope.ToggleTrackingViewCustSt = true;
                            $scope.TaskViewEmp_id = data.allocated_emp_id;
                            $scope.ToggleTrackingShowRedraw = true;
                            var index = _.findIndex($scope.onlineemp, function(item) {
                                return item.user_id == $scope.TaskViewEmp_id;
                            });
                             if (index > -1) {

                                $scope.ToggleRouteOrigin = [$scope.onlineemp[index].lat, $scope.onlineemp[index].lng];
                            }

                            $scope.ToggleRouteDestination = [data.loc_lat, data.loc_lng];
                            $scope.ToggleRouteStatus = true;
                        }


                        if ((data.allocated_emp_id) && (data.status == 'Delivered' || data.status == 'Incomplete')) {
                            // star Tracking view
                            $scope.ToggleTrackingViewCenter = [data.loc_lat, data.loc_lng];
                            $scope.ToggleTrackingViewCust.lat = data.loc_lat;
                            $scope.ToggleTrackingViewCust.lng = data.loc_lng;
                            $scope.ToggleTrackingViewShowAllEmp = false;
                            $scope.ToggleTrackingViewSingleEmp = false;
                            $scope.ToggleTrackingViewCustSt = true;
                            $scope.TaskViewEmp_id = data.allocated_emp_id;



                           // ToggleGPSData



 $http.get('getTaskSummary/'+$scope.TaskView.id).then(function(response) {
 // $http.get('assets/app/travel-map/data.json').then(function(response) {


                var res = angular.fromJson(response);
                if (res.data.status == 'ok') {
                      $scope.taskGeoData = [];

                      angular.element("#panelId")[0].innerHTML = res.data.data.distance+', Taken '+res.data.data.time_taken
$scope.taskStart = moment(res.data.data.start).format("Do MMM, h:mm A");
$scope.taskEnd =  moment(res.data.data.end).format("Do MMM, h:mm A");

    angular.forEach(res.data.data.gpsData, function(value, key) {


    $scope.taskGeoData.push([value.lat,value.lng]);


    });
                   // $scope.taskGeoData = res.data.data.gpsData;



                    $scope.ToggleGPSData = true;
                } else {
                }



                            });
                            // $scope.ToggleTrackingShowRedraw = true;
                            // var index = _.findIndex($scope.onlineemp, function(item) {
                            //     return item.user_id == $scope.TaskViewEmp_id;
                            // });
                            //  if (index > -1) {

                            //     $scope.ToggleRouteOrigin = [$scope.onlineemp[index].lat, $scope.onlineemp[index].lng];
                            // }

                            // $scope.ToggleRouteDestination = [data.loc_lat, data.loc_lng];
                            // $scope.ToggleRouteStatus = true;
                        }
                    }
                    if (data.status == 'Unallocated') {
                        // set allocation mode
                        $scope.ToggleTrackingViewCenter = [data.loc_lat, data.loc_lng];
                        $scope.ToggleTrackingViewCust.lat = data.loc_lat;
                        $scope.ToggleTrackingViewCust.lng = data.loc_lng;
                        $scope.ToggleTrackingViewCustSt = true;
                        $scope.ToggleTrackingViewShowAllEmp = true;
                        $scope.ToggleTrackingShowRedraw = false;
                    }

                      if (data.status == 'Canceled') {
                        // set allocation mode
                        $scope.ToggleTrackingViewCenter = [data.loc_lat, data.loc_lng];
                        $scope.ToggleTrackingViewCust.lat = data.loc_lat;
                        $scope.ToggleTrackingViewCust.lng = data.loc_lng;
                        $scope.ToggleTrackingViewCustSt = true;
                        $scope.ToggleTrackingViewShowAllEmp = false;
                        $scope.ToggleTrackingShowRedraw = false;
                    }

                     setTimeout(function() {  $scope.$apply();      }, 1000);
        }

        setTimeout(function() {
            $scope.RouteDestination = [12.9830, 80.2594];
            $scope.RouteOrigin = [12.90230, 80.2294];
            $scope.$apply();
        }, 1000);
        $scope.setPanel = function(renderer) {


                             if (angular.element("#panelId")[0]) {
                    angular.element("#panelId")[0].innerHTML = '';
                }
            renderer.setPanel(document.getElementById('panelId'));
        }
        // $scope.ToggleTrackingView(); //hide everything
        //   $scope.ToggleTrackingView(); //show everything
        //$ scope.ToggleTrackingView(); //hide everything


    }
})();
