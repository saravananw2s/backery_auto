angular.module('app').constant('_', window._).config(['unsavedWarningsConfigProvider', '$httpProvider', '$provide', '$stateProvider', '$mdDateLocaleProvider', '$urlRouterProvider', 'localStorageServiceProvider', 'ngIntlTelInputProvider', '$locationProvider',
        function(unsavedWarningsConfigProvider, $httpProvider, $provide, $stateProvider, $mdDateLocaleProvider, $urlRouterProvider, localStorageServiceProvider, ngIntlTelInputProvider, $locationProvider) {



 $provide.decorator('$exceptionHandler', ['$log', '$delegate',
                    function($log, $delegate) {
                        return function(exception, cause) {
                            $delegate(exception, cause);
                            var formatted = '';
                            var properties = '';
                            formatted += 'Exception: "' + exception.toString() + '"\n';
                            formatted += 'Caused by: ' + cause + '\n';
                            properties += (exception.message) ? 'Message: ' + exception.message + '\n' : ''
                            properties += (exception.fileName) ? 'File Name: ' + exception.fileName + '\n' : ''
                            properties += (exception.lineNumber) ? 'Line Number: ' + exception.lineNumber + '\n' : ''
                            properties += (exception.stack) ? 'Stack Trace: ' + exception.stack + '\n' : ''
                            if (properties) {
                                formatted += properties;
                            }
                            var data = {
                                info: formatted
                            };
                            globalapp.post('/api/jserror', data);
                            $log.debug('Sending Errors to Server for Developer Concerns.');
                        };
                    }
                ]);



            if (!globalapp.debugMode) {

                $provide.factory('HttpInterceptor', function($q, $injector, $location) {
                    var canceller = $q.defer();
                    return {
                        'request': function(config) {
                            if (config.url.includes(".html") || config.url.includes(".svg") || config.url.includes(".js")) {} else {
                                config.url = "api/" + config.url;
                            }
                            // do something on success
                            return config;
                        },
                        // optional method
                        'requestError': function(rejection) {
                            // do something on error
                            // if (canRecover(rejection)) {
                            //   return responseOrNewPromise
                            // }
                            // return $q.reject(rejection);
                            return rejection;
                        },
                        // optional method
                        'response': function(response) {
                            return response;
                        },
                        // optional method
                        'responseError': function(rejection) {
                            if (rejection.status === 401) {
                                console.log('401')
                                // canceller.resolve('Unauthorized');
                                globalapp.logout()
                                //  window.location = '/#/dashboard/logout'
                            }
                            if (rejection.status === 403) {
                                console.log('403')
                                //canceller.resolve('Forbidden');
                                //$location.url('/');
                            }
                            if (rejection.status === 500) {
                                console.log('500')
                                globalapp.post('/jserror', rejection);
                                //canceller.resolve('Forbidden');
                                //$location.url('/');
                            }
                            return rejection;
                        }
                    };
                });
            } else {
                $provide.factory('HttpInterceptor', function($q, $injector, $location) {
                    var canceller = $q.defer();
                    return {
                        'request': function(config) {
                            if (config.url.includes(".html") || config.url.includes(".svg") || config.url.includes(".js")) {} else {
                                config.url = "api/" + config.url;
                            }
                            // do something on success
                            return config;
                        },
                        // optional method
                        'requestError': function(rejection) {
                            // do something on error
                            // if (canRecover(rejection)) {
                            //   return responseOrNewPromise
                            // }
                            // return $q.reject(rejection);
                            return rejection;
                        },
                        // optional method
                        'response': function(response) {
                            return response;
                        },
                        'responseError': function(rejection) {
                            if (rejection.status === 401) {
                                console.log('401')
                                globalapp.logout()
                            }
                            return rejection;
                        }
                    };
                });
            }
            $httpProvider.interceptors.push('HttpInterceptor')
            // $httpProvider.defaults.cache = true;
            localStorageServiceProvider.setPrefix('app_sfa').setNotify(true, true);
            ngIntlTelInputProvider.set({
                defaultCountry: 'IN'
            });
            $urlRouterProvider.otherwise(function($injector, $location) {
                var $state = $injector.get("$state");
                $state.go("signin", {
                    notify: false
                });
            });
            $stateProvider.state('admin', {
                    url: '/app',
                    abstract: true,
                    templateUrl: "assets/app/app.html"
                })


                .state('forgot', {
                    url: '/forgot',
                    templateUrl: 'assets/app/forgot/forgot.html',
                    controller: 'ForgotCtrl',

                })

                // .state('signin', {
                //     url: '/signin',
                //     templateUrl: 'assets/app/login/login.html',
                //     controller: 'LoginCtrl'
                // })

                                .state('signin', {
                    url: '/signin',
                    templateUrl: 'assets/app/login/login.html',
                    controller: function()
                    {
                        document.location = "/dashboard/login";
                    },
                })

                .state('logout', {
                    url: '/logout',
                    templateUrl: 'assets/app/login/login.html',
                    controller: 'LogoutCtrl'
                }).state('admin.dashboard', {
                    url: '/home',
                    templateUrl: 'assets/app/admin-dashboard/dashboard.html',
                    controller: 'AdminDashboardCtrl'
                }).state('admin.company_dashboard', {
                    url: '/company_home',
                    templateUrl: 'assets/app/dashboard/dashboard.html',
                    controller: 'DashboardCtrl'
                }).state('admin.company', {
                    url: '/company',
                    params: {
                        mode: null,
                        data: null,
                    },
                    templateUrl: 'assets/app/company/company.html',
                    controller: 'CompanyCtrl',
                    data: {
                        permissions: {
                            only: ['SUPERADMIN'],
                            redirectTo: 'admin.dashboard'
                        }
                    }
                }).state('admin.companyview', {
                    url: '/company/view/:id',
                    templateUrl: 'assets/app/company/company.view.html',
                    controller: 'CompanyViewCtrl',
                    data: {
                        permissions: {
                            only: ['SUPERADMIN'],
                            redirectTo: 'admin.dashboard'
                        }
                    }
                })


                 .state('admin.mobileapp', {
                    url: '/mobileapp',
                    templateUrl: 'assets/app/mobile-app/mobile.html',
                    // controller: 'MapCtrl',
                })

                .state('admin.map', {
                    url: '/map',
                    templateUrl: 'assets/app/map/map.html',
                    controller: 'MapCtrl',
                }).state('admin.travelmap', {
                    url: '/travelmap',
                    templateUrl: 'assets/app/travel-map/travel-map.html',
                    controller: 'TravelMapCtrl',
                })


                .state('admin.report', {
                    url: '/report',
                    templateUrl: 'assets/app/report/report.html',
                    controller: 'ReportCtrl',
                })



                .state('admin.user', {
                    url: '/user',
                    params: {
                        mode: null,
                        data: null,
                    },
                    templateUrl: 'assets/app/user/user.html',
                    controller: 'UserCtrl',
                    data: {
                        permissions: {
                            only: ['SUPERADMIN', 'ADMIN', 'MANAGER'],
                            redirectTo: 'admin.dashboard'
                        }
                    }
                }).state('admin.userview', {
                    url: '/user/view/:id',
                    params: {
                        id: null,
                    },
                    templateUrl: 'assets/app/user/user.view.html',
                    controller: 'UserViewCtrl',
                    data: {
                        permissions: {
                            only: ['SUPERADMIN', 'ADMIN', 'MANAGER'],
                            redirectTo: 'admin.dashboard'
                        }
                    }
                }).state('admin.activities', {
                    url: '/activities',
                    templateUrl: 'assets/app/activities/activities.html',
                    controller: 'ActivitiesCtrl'
                }).state('admin.prospect', {
                    url: '/prospect',
                    templateUrl: 'assets/app/prospect/prospect.html',
                    controller: 'ProspectCtrl'
                }).state('admin.category', {
                    url: '/category',
                    templateUrl: 'assets/app/category/category.html',
                    controller: 'CategoryCtrl'
                }).state('admin.product', {
                    url: '/product',
                    params: {
                        mode: null,
                        data: null,
                    },
                    templateUrl: 'assets/app/product/product.html',
                    controller: 'ProductCtrl',
                }).state('admin.productview', {
                    url: '/product/view/:id',
                    params: {
                        id: null,
                    },
                    templateUrl: 'assets/app/product/product.view.html',
                    controller: 'ProductViewCtrl',
                })

                .state('admin.customer', {
                    url: '/customer',
                    params: {
                        mode: null,
                        data: null,
                    },
                    templateUrl: 'assets/app/customer/customer.html',
                    controller: 'CustomerCtrl',
                }).state('admin.customerview', {
                    url: '/customer/view/:id',
                    params: {
                        id: null,
                    },
                    templateUrl: 'assets/app/customer/customer.view.html',
                    controller: 'CustomerViewCtrl',
                })


                 .state('admin.customer-review', {
                    url: '/customer-review',
                    params: {
                        mode: null,
                        data: null,
                    },
                    templateUrl: 'assets/app/customer-review/customer-review.html',
                    controller: 'CustomerReviewCtrl',
                }).state('admin.customer-review-view', {
                    url: '/customer-review/view/:id',
                    params: {
                        id: null,
                    },
                    templateUrl: 'assets/app/customer-review/customer-review.view.html',
                    controller: 'CustomerReviewViewCtrl',
                })


                .state('admin.customer-stats', {
                    url: '/customer-stats',
                    params: {
                        mode: null,
                        data: null,
                    },
                    templateUrl: 'assets/app/customer-stats/customer-stats.html',
                    controller: 'CustomerStatsCtrl',
                }).state('admin.customer-statsview', {
                    url: '/customer-statsview/:id',
                    templateUrl: 'assets/app/customer-stats/customer-stats.view.html',
                    controller: 'CustomerStatsViewCtrl',
                }).state('admin.competitor', {
                    url: '/competitor',
                    params: {
                        mode: null,
                        data: null,
                    },
                    templateUrl: 'assets/app/competitor/competitor.html',
                    controller: 'CompetitorCtrl',
                }).state('admin.competitorview', {
                    url: '/competitor/view/:id',
                    params: {
                        id: null,
                    },
                    templateUrl: 'assets/app/competitor/competitor.view.html',
                    controller: 'CompetitorViewCtrl',
                }).state('admin.visit', {
                    url: '/visit',
                    params: {
                        mode: null,
                        data: null,
                    },
                    templateUrl: 'assets/app/visit-report/visit-report.html',
                    controller: 'VisitCtrl',
                }).state('admin.visitview', {
                    url: '/visit/view/:id',
                    params: {
                        id: null,
                    },
                    templateUrl: 'assets/app/visit-report/visit-report.view.html',
                    controller: 'VisitViewCtrl',
                }).state('admin.travelexpense', {
                    url: '/travelexpense',
                    params: {
                        mode: null,
                        data: null,
                    },
                    templateUrl: 'assets/app/travel-expense/travel-expense.html',
                    controller: 'TravelExpenseCtrl',
                }).state('admin.travelexpenseview', {
                    url: '/travelexpense/view/:id',
                    params: {
                        id: null,
                    },
                    templateUrl: 'assets/app/travel-expense/travel-expense.view.html',
                    controller: 'TravelExpenseViewCtrl',
                }).state('admin.market', {
                    url: '/market',
                    params: {
                        mode: null,
                        data: null,
                    },
                    templateUrl: 'assets/app/market-intelligence/market-intelligence.html',
                    controller: 'MarketCtrl',
                }).state('admin.marketview', {
                    url: '/market/view/:id',
                    params: {
                        id: null,
                    },
                    templateUrl: 'assets/app/market-intelligence/market-intelligence.view.html',
                    controller: 'MarketViewCtrl',
                }).state('admin.attandance', {
                    url: '/attendance',
                    params: {
                        mode: null,
                        data: null,
                    },
                    templateUrl: 'assets/app/attandance/attandance.html',
                    controller: 'AttandanceCtrl',
                }).state('admin.attandanceview', {
                    url: '/attendance/view/:id',
                    params: {
                        id: null,
                    },
                    templateUrl: 'assets/app/attandance/attandance.view.html',
                    controller: 'AttandanceViewCtrl',
                }).state('admin.newprojectopp', {
                    url: '/newprojectopp',
                    params: {
                        mode: null,
                        data: null,
                    },
                    templateUrl: 'assets/app/new-project-opp/new-project-opp.html',
                    controller: 'NewProjectOppCtrl',
                }).state('admin.newprojectoppview', {
                    url: '/newprojectopp/view/:id',
                    params: {
                        id: null,
                    },
                    templateUrl: 'assets/app/new-project-opp/new-project-opp.view.html',
                    controller: 'NewProjectOppViewCtrl',
                }).state('admin.requestinfo', {
                    url: '/requestinfo',
                    params: {
                        mode: null,
                        data: null,
                    },
                    templateUrl: 'assets/app/request-info/request-info.html',
                    controller: 'RequestCtrl',
                }).state('admin.requestinfoview', {
                    url: '/requestinfo/view/:id',
                    params: {
                        id: null,
                    },
                    templateUrl: 'assets/app/request-info/request-info.view.html',
                    controller: 'RequestViewCtrl',
                }).state('admin.caseinfo', {
                    url: '/caseinfo',
                    params: {
                        mode: null,
                        data: null,
                    },
                    templateUrl: 'assets/app/case-info/case-info.html',
                    controller: 'CaseInfoCtrl',
                }).state('admin.caseinfoview', {
                    url: '/caseinfo/view/:id',
                    params: {
                        id: null,
                    },
                    templateUrl: 'assets/app/case-info/case-info.view.html',
                    controller: 'CaseInfoViewCtrl',
                }).state('admin.order', {
                    url: '/order',
                    params: {
                        mode: null,
                        data: null,
                    },
                    templateUrl: 'assets/app/order/order.html',
                    controller: 'OrderCtrl',
                }).state('admin.orderview', {
                    url: '/order/view/:id',
                    params: {
                        id: null,
                    },
                    templateUrl: 'assets/app/order/order.view.html',
                    controller: 'OrderViewCtrl',
                })


                .state('admin.new-schedule', {
                    url: '/new-schedule',
                    params: {
                        mode: null,
                        data: null,
                    },
                    templateUrl: 'assets/app/new-schedule/schedule.html',
                    controller: 'NewScheduleCtrl',
                })


                .state('admin.schedule', {
                    url: '/schedule',
                    params: {
                        mode: null,
                        data: null,
                    },
                    templateUrl: 'assets/app/schedule/schedule.html',
                    controller: 'ScheduleCtrl',
                }).state('admin.scheduleview', {
                    url: '/schedule/view/:id',
                    params: {
                        id: null,
                    },
                    templateUrl: 'assets/app/schedule/schedule.view.html',
                    controller: 'ScheduleViewCtrl',
                }).state('admin.profile', {
                    url: '/profile',
                    templateUrl: 'assets/app/profile/profile.html',
                    data: {
                        permissions: {
                            only: ['ADMIN', 'MANAGER'],
                            redirectTo: 'admin.dashboard'
                        }
                    },
                    controller: 'ProfileCtrl'
                }).state('admin.dev', {
                    url: '/dev',
                    params: {
                        mode: null,
                        data: null,
                    },
                    templateUrl: 'assets/app/dev/dev.html',
                    // controller: 'DevCtrl'
                }).state('admin.devview', {
                    url: '/dev/view/:id',
                    templateUrl: 'assets/app/dev/view.html',
                    controller: 'DevViewCtrl'
                }).state('404', {
                    url: '/404',
                    templateUrl: "assets/app/page-extra/404.html"
                }).state('500', {
                    url: '/500',
                    templateUrl: "assets/app/page-extra/500.html"
                })
                /*            // charts
                            .state('admin.chart-line', {
                                    url: '/chart/line',
                                    templateUrl: 'assets/app/chart/line.html'
                                })
                                .state('admin.chart-bar', {
                                    url: '/chart/bar',
                                    templateUrl: 'assets/app/chart/bar.html'
                                })
                                .state('admin.chart-pie', {
                                    url: '/chart/pie',
                                    templateUrl: 'assets/app/chart/pie.html'
                                })
                                .state('admin.chart-scatter', {
                                    url: '/chart/scatter',
                                    templateUrl: 'assets/app/chart/scatter.html'
                                })
                                .state('admin.chart-radar', {
                                    url: '/chart/radar',
                                    templateUrl: 'assets/app/chart/radar.html'
                                })
                                .state('admin.chart-funnel', {
                                    url: '/chart/funnel',
                                    templateUrl: 'assets/app/chart/funnel.html'
                                })
                                .state('admin.chart-gauge', {
                                    url: '/chart/gauge',
                                    templateUrl: 'assets/app/chart/gauge.html'
                                })
                                .state('admin.chart-more', {
                                    url: '/chart/more',
                                    templateUrl: 'assets/app/chart/more.html'
                                })
                */
                // .state('signup', {
                //     url: '/signup',
                //     templateUrl: 'assets/app/page-extra/signup.html'
                // }).state('forgot-password', {
                //     url: '/forgot-password',
                //     templateUrl: 'assets/app/page-extra/forgot-password.html'
                // }).state('confirm-email', {
                //     url: '/confirm-email',
                //     templateUrl: 'assets/app/page-extra/confirm-email.html'
                // }).state('lock-screen', {
                //     url: '/lock-screen',
                //     templateUrl: 'assets/app/page-extra/lock-screen.html'
                // }).state('maintenance', {
                //     url: '/maintenance',
                //     templateUrl: "assets/app/page-extra/maintenance.html"
                // });
            unsavedWarningsConfigProvider.logEnabled = false;
            unsavedWarningsConfigProvider.routeEvent = '$stateChangeStart';
            unsavedWarningsConfigProvider.useTranslateService = false;
            // $locationProvider.html5Mode(true);
        }
    ])
    /*
    .directive("displayFile", function() {

        var updateElem = function(element) {


            return function(displayFile) {

                element.empty();

                var objectElem = {}
                if (displayFile && displayFile.type !== "") {
                    if (displayFile.type === "pdf") {
                        objectElem = angular.element(document.createElement("object"));
                        objectElem.attr("data", displayFile.fileUrl);
                        objectElem.attr("type", "application/pdf");

                    } else {
                        objectElem = angular.element(document.createElement("img"));
                        objectElem.attr("src", displayFile.fileUrl);


                    }

                    console.log(displayFile);
                }



                element.append(objectElem);
            };
        };

        return {
            restrict: "EA",
            scope: {
                displayFile: "="
            },
            link: function(scope, element) {
                scope.$watch("displayFile", updateElem(element));
            }
        };
    })

    */
    .run(function($rootScope, $state, $http, localStorageService, api, PermPermissionStore, PermRoleStore) {
        PermRoleStore.defineManyRoles({
            'MANAGER': function() {
                return api.manager();
            },
            'ADMIN': function() {
                return api.admin();
            },
            'SUPERADMIN': function() {
                return api.superAdmin();
            }
        });
        if (localStorageService.get('client-data') == null) {
            var client_data = new Fingerprint2();
            var info = client_data.get(function(result) {
                localStorageService.set("client-data", result);
                $http.defaults.headers.common["x-client-data"] = localStorageService.get('client-data');
            });
        } else {
            $http.defaults.headers.common["x-client-date"] = moment().format();
            $http.defaults.headers.common["x-client-data"] = localStorageService.get('client-data');
        }
        FastClick.attach(document.body);
        $http.defaults.headers.common['Accept'] = 'application/json';

 $rootScope.$on("$stateChangeStart", function(event, toState, toParams, fromState, fromParams) {
            var isLogin = (toState.name === "signin" || toState.name === "forgot");
            if (isLogin) {
                return;
            } else {
                if (localStorageService.isSupported) {
                    var token = localStorageService.get('apitoken');
                    if (token !== null) {
                        $http.defaults.headers.common.Authorization = localStorageService.get('apitoken');
                        if (api.superAdmin()) {
                            $http.defaults.headers.common["x-sub-root-domain"] = api.get_apiurl();
                        }
                        if (localStorageService.get('role') == null) {
                            $http.get('/role').success(function(data, status) {
                                localStorageService.set('role', data);
                            });
            
                        }
                        if (!window.Echo) {
                            api.SocketInit();
                            if (api.manager()) {
                                var user_id = '';
                                var profile = api.profile();
                                  profile().then().then(function(data) {
                                    user_id = data.data.user_id;
                                    window.Echo.private(globalapp.channel + 'user-' + user_id).listen('LocationUpdate', (e) => {

                                        $rootScope.$broadcast('LocationUpdate', e);
                                    })
                                .notification((e) => {
                                    if(e.type == 'App\\Notifications\\TaskCompleted' )
                                    {
                                            $rootScope.$broadcast('TaskCompleted', e);
                                    }

                                })
                                   .listen('NotificationEvent', (e) => {

                                    console.log(e);
                                     $rootScope.$broadcast('NotificationEvent', e);

                                         })
                                    .listen('GeoFenceFromMobile', (e) => {
                                        $rootScope.$broadcast('GeoFenceFromMobile', e);
                                    }).listen('GeoFenceFromWeb', (e) => {
                                        $rootScope.$broadcast('GeoFenceFromWeb', e);
                                    });
                                });
                            } else {
                                if (api.superAdmin()) {
                                    var domain = api.getSubDomain() + '-';
                                } else {
                                    var domain = globalapp.channel;
                                }




                                window.Echo.private(domain + 'admin').listen('LocationUpdate', (e) => {
                                    $rootScope.$broadcast('LocationUpdate', e);
                                })
                                .notification((e) => {
                                    $rootScope.$broadcast('TaskCompleted', e);
                                })
                                .listen('GeoFenceFromMobile', (e) => {
                                    $rootScope.$broadcast('GeoFenceFromMobile', e);
                                }).listen('GeoFenceFromWeb', (e) => {
                                    $rootScope.$broadcast('GeoFenceFromWeb', e);
                                });
                            }
                        }
                    } else {
                        event.preventDefault();
                        globalapp.logout()
                        api.SocketDisconnect();
                        // $state.go('logout'); // logout :)
                    }
                } else {
                    // Local localStorageService not supported
                    alert('Browser is Not Supported Local Storage and Cookies');
                    window.location = 'about:blank';
                }
            }
        });
    });
