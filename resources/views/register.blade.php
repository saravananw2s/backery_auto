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
        <div id="loader-container" data-loading>
            <svg class="spinner" height="65px" viewbox="0 0 66 66" width="65px" xmlns="http://www.w3.org/2000/svg">
                <circle class="path" cx="33" cy="33" fill="none" r="30" stroke-linecap="round" stroke-width="6">
                </circle>
            </svg>
        </div>


<div class="page-auth" ng-controller="SignUpCtrl" >
    <div class="main-body"  style="    padding-top: 2% !important;">
        <div class="card bg-white">
            <div class="card-content">


            <h5 style="">Delivery Account Sign Up</h5>


                <form ng-show="show_signup" name="data_form" class="md-form-auth form-validation" novalidate="" ng-submit="signup()">
                    <fieldset>

                    <div class="col-md-12 nopad">

                     <div class="col-md-6 nopad">

                                                <md-input-container class="md-block">
                            <label>Last name</label>
                            <md-icon class="material-icons">perm_identity</md-icon>
                            <input required
                                   type="text"
                                   name="last_name"
                                   id="last-name" 
                                   ng-model="data.last_name">
                                                <div ng-messages="data_form.last_name.$error" multiple ng-if='data_form.last_name.$dirty'>
                                <div ng-message="required">This is required.</div>
                            </div>
                        </md-input-container>

                    </div>


                           <div class="col-md-6 nopad">
 <md-input-container class="md-block">
                            <label>First name</label>
                            <md-icon class="material-icons">perm_identity</md-icon>
                            <input required
                                   type="text"
                                   name="first_name"
                                   id="first-name"
                                   ng-model="data.first_name">
                            <div ng-messages="data_form.first_name.$error" multiple ng-if='data_form.first_name.$dirty'>
                                <div ng-message="required">This is required.</div>
                            </div>
                        </md-input-container>
</div>


                    </div>



       <div class="col-md-12 nopad">
                            <md-input-container class="md-block">
                            <label class="phone">Phone no</label>
                            <md-icon class="material-icons">phone</md-icon>
                            <input required
                                   type="text"
                                   name="phone"
                                   id="phone"
                                   ng-model="data.phone"  ng-intl-tel-input>
                        <div ng-messages="data_form.phone.$error" multiple ng-if='data_form.phone.$dirty'>
                                <div ng-message="required">This is required.</div>
                            </div>
                        </md-input-container>
</div>

<div class="col-md-12 nopad">
                        <md-input-container class="md-block">
                            <label>Email</label>
                            <md-icon class="material-icons">mail_outline</md-icon>
                            <input required
                                   type="email"
                                   name="email"
                                   id="email"
                                   ng-model="data.email"
                                   ng-pattern="/^.+@.+\..+$/" />
                            <div ng-messages="data_form.email.$error" multiple ng-if='data_form.email.$dirty'>
                                <div ng-message="required">This is required.</div>
                                <div ng-message="pattern">It must be an e-mail address.</div>
                            </div>
                        </md-input-container>
</div>




<!-- <div class="col-md-12 nopad">
                        <md-input-container class="md-block">
                         <md-icon class="material-icons">place_outline</md-icon>
                            <label>Address</label>
                            <textarea  md-maxlength="1500"
                            ng-model="cus_info.notes" md-select-on-focus></textarea>
                        </md-input-container>
</div> -->
                       <!--  <p class="text-small no-margin">By clicking on sign up, you agree to <a href="javascript:;"><i>terms</i></a> and <a href="javascript:;"><i>privacy policy</i></a></p>
 -->
                        <div class="divider divider-md"></div>
                        <md-button type="submit"  
                          id="signup-button"

                                   class="md-raised pull-right md-primary"
                                  >Sign Up</md-button>

                    </fieldset>
                </form>






                <form ng-hide="show_signup" name="data_form1" class="md-form-auth form-validation" novalidate="" ng-submit="login()">
                    <fieldset>



<div class="col-md-12 nopad">
                        <md-input-container class="md-block">
                            <label>Email</label>
                            <md-icon class="material-icons">mail_outline</md-icon>
                            <input required readonly=""
                                   type="email"
                                   name="email"
                                   id="login-email"
                                   ng-model="data.email"
                                   ng-pattern="/^.+@.+\..+$/" />
                            <div ng-messages="data_form1.email.$error" multiple ng-if='data_form1.email.$dirty'>
                                <div ng-message="required">This is required.</div>
                                <div ng-message="pattern">It must be an e-mail address.</div>
                            </div>
                        </md-input-container>
</div>
<div class="col-md-12 nopad">
                        <md-input-container class="md-block">
                            <label>Password</label>
                            <md-icon class="material-icons">mail_outline</md-icon>
                            <input required
                                   type="password"
                                   id="login-password"
                                   name="password"
                                   ng-model="data.password"
                                />
                            <div ng-messages="data_form1.password.$error" multiple ng-if='data_form1.password.$dirty'>
                                <div ng-message="required">This is required.</div>

                            </div>
                        </md-input-container>
</div>


<p style="color:red" id="custom-errors">
{{alert}}
</p>

<br>
                        <p class="text-small no-margin">We have sent the password to your email address, if you given wrong email id please sign up again

                        <a onclick="location.reload();" id="reload-button"><i>here</i></a>, if you not got email click  
                        <a id="resend-button" href="javascript:;" ng-click="resendEmail()"><i>here</i></a> to resend password

                  </p>

                        <div class="divider divider-md"></div>
                        <md-button type="submit"

                        id="login-button"
                                   class="md-raised pull-right md-primary"
                                  >Login </md-button>

                    </fieldset>
                </form>



                       <div class="additional-info">
                    <a href="/dashboard/login" id="login-link">
                        Login
                    </a>
                    <span class="divider-h">
                    </span>
                    <a href="/dashboard/forgot" id="forgot-link">
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
                   if ($scope.data_form1.$valid) {
                var data = {
                    email: '',
                    password: ''
                };
                data.email = $scope.data.email;
                data.password = $scope.data.password;
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



                        window.location='/dashboard#/app/user';
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
