<!DOCTYPE html>
<html data-ng-app="app" lang="en"  ng-cloak>
    <head>
        <meta content="text/html;charset=utf-8" http-equiv="content-type" />
        <meta charset="utf-8" />
        <meta name="fragment" content="!" />
        <title>
            {{ config('app.name', 'ManageTeamz') }}

        </title>
        <base href="/dashboard" />
        <meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0" name="viewport" />
        <meta content="yes" name="apple-mobile-web-app-capable" />
        <meta content="yes" name="apple-touch-fullscreen" />
        <link rel="manifest" href="assets/manifest.json">
        <link rel="icon" href="assets/favicon.ico" type="image/x-icon" />
                <!-- google fonts -->
                <script>
                    WebFontConfig = {
                google: { families: [ 'Roboto:100,300,400,400italic,500,700:latin' ] }
            };
            (function() {
                var wf = document.createElement('script');
                // wf.src = 'bower_components/webfontloader/webfontloader.js';
                 wf.src = '//cdnjs.cloudflare.com/ajax/libs/webfont/1.6.27/webfontloader.js';
                wf.type = 'text/javascript';
                wf.async = 'true';
                var s = document.getElementsByTagName('script')[0];
                s.parentNode.insertBefore(wf, s);
            })();
                </script>


                    <link href="assets/styles/loader.css" rel="stylesheet"/>
                    <link href="//fonts.googleapis.com/icon?family=Material+Icons " rel="stylesheet" type="text/css"/>
                    <link href="//cdnjs.cloudflare.com/ajax/libs/angular-material/1.1.3/angular-material.min.css" rel="stylesheet" type="text/css"/>

                 <!--    <link href="//cdnjs.cloudflare.com/ajax/libs/intl-tel-input/11.0.7/css/intlTelInput.css" rel="stylesheet" type="text/css">
                    </link> -->
                    <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/intl-tel-input/6.0.6/css/intlTelInput.css">
                    <link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>


                    <link href="assets/styles/layout.css" rel="stylesheet" type="text/css"/>
                    <link href="assets/styles/theme.css" rel="stylesheet" type="text/css"/>
                    <link href="assets/styles/ui.css" rel="stylesheet" type="text/css"/>
                    <link href="assets/styles/app.css" rel="stylesheet" type="text/css"/>



    </head>


    <body id="body" class="body" >


@include('nav')
@verbatim
      <div class="page-auth">
    <div class="main-body">
        <div class="card bg-white">
            <div class="card-content" style="    padding: 0 !important" data-ng-controller="SignUpCtrl">
                  <h5 style="">Delivery Account Login</h5>
                <form class="md-form-auth form-validation" name="login_form" ng-submit="login()" style="padding-bottom: 7%;">
                    <fieldset>

                        <md-input-container class="md-block">
                            <label>
                                Email
                            </label>
                            <md-icon class="material-icons">
                                mail_outline
                            </md-icon>
                            <input name="email" ng-model="user.email" ng-pattern="/^.+@.+\..+$/" required="" type="email"/>
                            <div multiple="" ng-if="login_form.email.$dirty" ng-messages="login_form.email.$error">
                                <div ng-message="required">
                                    This is required.
                                </div>
                                <div ng-message="pattern">
                                    It must be an e-mail address.
                                </div>
                            </div>
                        </md-input-container>
                        <md-input-container class="md-block">
                            <label>
                                Password
                            </label>
                            <md-icon class="material-icons">
                                lock_outline
                            </md-icon>
                            <input name="password" ng-model="user.password" required="" type="password">
                                <div multiple="" ng-if="login_form.password.$dirty" ng-messages="login_form.password.$error">
                                    <div ng-message="required">
                                        This is required.
                                    </div>
                                </div>
                            </input>
                        </md-input-container>
                        <div>
                            {{alert}}
                        </div>
                        <md-button class="md-raised pull-right md-primary" type="submit">
                            Login
                        </md-button>
                    </fieldset>
                </form>
                <div class="additional-info">
                    <a href="dashboard/register">
                        Register
                    </a>
                    <span class="divider-h">
                    </span>
                    <a href="dashboard/forgot">
                        Forgot your password?
                    </a>
                </div>
            </div>
        </div>
    </div>
</div>

@endverbatim
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/2.2.4/jquery.min.js" type="text/javascript"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/angular.js/1.5.8/angular.min.js" type="text/javascript"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/angular.js/1.5.8/angular-animate.min.js" type="text/javascript"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/angular.js/1.5.8/angular-aria.min.js" type="text/javascript"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/angular.js/1.5.8/angular-messages.min.js" type="text/javascript"></script>
        <script src="assets/app/layout/loader.js" type="text/javascript"></script>
         <script src="//cdnjs.cloudflare.com/ajax/libs/angular-material/1.1.3/angular-material.min.js" type="text/javascript"></script>

        <script src="//cdnjs.cloudflare.com/ajax/libs/fingerprintjs2/1.5.0/fingerprint2.min.js" type="text/javascript"></script>
     <script src="//cdnjs.cloudflare.com/ajax/libs/intl-tel-input/6.0.6/lib/libphonenumber/build/utils.js" type="text/javascript"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/intl-tel-input/6.0.6/js/intlTelInput.min.js" type="text/javascript"></script>
   <script src="//cdnjs.cloudflare.com/ajax/libs/angular-local-storage/0.5.2/angular-local-storage.min.js" type="text/javascript"></script>
   <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<script type="text/javascript">
    var app = angular.module('app', ['ngAnimate'
        ,'ngAria'
        ,'ngMessages'
        ,'ngMaterial',
        ,'ngIntlTelInput'
        ,'LocalStorageModule'
        ]);
   angular.module('ngIntlTelInput', []);

angular.module('ngIntlTelInput')
  .provider('ngIntlTelInput', function () {
    var me = this;
    var props = {};
    var setFn = function (obj) {
      if (typeof obj === 'object') {
        for (var key in obj) {
          props[key] = obj[key];
        }
      }
    };
    me.set = setFn;

    me.$get = ['$log', function ($log) {
      return Object.create(me, {
        init: {
          value: function (elm) {
            if (!window.intlTelInputUtils) {
              $log.warn('intlTelInputUtils is not defined. Formatting and validation will not work.');
            }
            elm.intlTelInput(props);
          }
        },
      });
    }];
  });
 angular.module('ngIntlTelInput')
  .directive('ngIntlTelInput', ['ngIntlTelInput', '$log',
    function (ngIntlTelInput, $log) {
      return {
        restrict: 'A',
        require: 'ngModel',
        link: function (scope, elm, attr, ctrl) {
          // Warning for bad directive usage.
          if (attr.type !== 'text' || elm[0].tagName !== 'INPUT') {
            $log.warn('ng-intl-tel-input can only be applied to a *text* input');
            return;
          }
          // Override default country.
          if (attr.defaultCountry) {
            ngIntlTelInput.set({defaultCountry: attr.defaultCountry});
          }
          // Initialize.
          ngIntlTelInput.init(elm);
          // Validation.
          ctrl.$validators.ngIntlTelInput = function (value) {
            return elm.intlTelInput("isValidNumber");
          };
          // Set model value to valid, formatted version.
          ctrl.$parsers.push(function (value) {


            return elm.intlTelInput('getNumber').replace(/[^\d]/, '');
          });
          // Set input value to model value and trigger evaluation.
          ctrl.$formatters.push(function (value) {
            if (value) {
              value = value.charAt(0) === '+' || '+' + value;
              elm.intlTelInput('setNumber', value);
            }
            return value;
          });
        }
      };
    }])
   .directive('loading',   ['$http' ,function ($http)
    {
        return {
            restrict: 'A',
            link: function (scope, elm, attrs)
            {
                scope.isLoading = function () {
                    return $http.pendingRequests.length > 0;
                };

                scope.$watch(scope.isLoading, function (v)
                {
                    if(v){
                        elm.show();
                    }else{
                        elm.hide();
                    }
                });
            }
        };
      }]);


app.config(function (localStorageServiceProvider,ngIntlTelInputProvider) {
         localStorageServiceProvider.setPrefix('app_sfa').setNotify(true, true);
            ngIntlTelInputProvider.set({
                defaultCountry: 'IN'
            });




  })

    app.controller('SignUpCtrl',function($scope, $http, $mdDialog,localStorageService)
    {


               if (localStorageService.isSupported) {
            var token = localStorageService.get('apitoken');
            if (token !== null) {
              document.location = '/dashboard#/app/company_home';
            }
        }



     if (localStorageService.get('client-data') == null) {
            var client_data = new Fingerprint2();
            var info = client_data.get(function(result) {
                localStorageService.set("client-data", result);
                $http.defaults.headers.common["x-client-data"] = localStorageService.get('client-data');
            });
        } else {
            $http.defaults.headers.common["x-client-data"] = localStorageService.get('client-data');
        }



          // localStorageServiceProvider.setPrefix('app_sfa').setNotify(true, true);
          //   ngIntlTelInputProvider.set({
          //       defaultCountry: 'IN'
          //   });


            $scope.show_signup = true;


    $scope.signup = function() {


  if ($scope.data_form.$invalid) {
                    return;
                }

   $http.put('dashboard/signup', {
                    data: $scope.data
                }).then(function(response) {
                    var res = angular.fromJson(response)
                    if (res.data.status == 'ok') {

                          //$mdDialog.show($mdDialog.alert().title(res.data.data).ok('OK'));

                             $scope.show_signup = false;
                    } else {
                        $mdDialog.show($mdDialog.alert().title(res.data.data).ok('OK'));
                    }
                });



                }



    $scope.resendEmail = function() {


           var data = {
                    email: '',
                    password: ''
                };
                data.email = $scope.data.email;
                data.password = $scope.data.password;


   $http.post('api/forget', {
                    data: data
                }).success(function(data, status) {
                    var res = angular.fromJson(data);
                    console.log(res.status);
                    if (res.status === 'ok') {

                        $scope.alert = res.data;
                              $scope.submit = true;
                    } else {
                        localStorageService.remove("apitoken");
                        if (res.data instanceof Array) {
                            $scope.alert = res.data[0];
                        } else {
                            $scope.alert = res.data;
                        }
                    }
                });
}

    $scope.login = function() {
                   if ($scope.login_form.$valid) {
                var data = {
                    email: '',
                    password: ''
                };
                data.email = $scope.user.email;
                data.password = $scope.user.password;
                $http.post('/api/auth?api=web', {
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

                        window.location='/dashboard#/app/company_home';
                    } else {
                        localStorageService.remove("apitoken");
                        if (res.data instanceof Array) {
                            $scope.alert = res.data[0];
                        } else {
                            $scope.alert = res.data;
                        }
                    }
                });
              }
            }

    });
</script>
        <!-- endinject -->
        <!-- endbuild -->
    </body>
</html>
