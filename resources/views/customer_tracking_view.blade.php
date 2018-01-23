
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
<style type="text/css">
  .rating {
    color: #a9a9a9;
    margin: 0;
    padding: 0;
}
ul.rating {
    display: inline-block;
}
.rating li {
    list-style-type: none;
    display: inline-block;
    padding: 1px;
    text-align: center;
    font-weight: bold;
    cursor: pointer;
       font-size: 2em;
}
.rating .filled {
    color: orangered;
}
.clear{
  margin-top:20px;
}
.nomar{
  margin: 0px;
}

.st {
    float: right;
    background: #345989;
    color: white;
    padding-top: 1px;
    padding-bottom: 1px;
    text-align: center;
    font-size: 15px;
    padding-right: 7px;
    padding-left: 7px;
    border-radius: 5px;
    margin: 0px !important;
    font-weight: 800;
}
</style>


    </head>


    <body id="body" ng-controller="TrackingCtrl">

@verbatim
        <div id="loader-container" data-loading>
            <svg class="spinner" height="65px" viewbox="0 0 66 66" width="65px" xmlns="http://www.w3.org/2000/svg">
                <circle class="path" cx="33" cy="33" fill="none" r="30" stroke-linecap="round" stroke-width="6">
                </circle>
            </svg>
        </div>



      <nav class="navbar mtz-logo-head " style="

      min-height: 65px;
    z-index: 1000;
    background: white;
    padding: 0px;
    margin: 0px;
    border-radius: 0px;


    ">


             <a ><img style="       height: 60px;
    margin-left: auto;
    margin-right: auto;  height: 60px;" src="http://manageteamz.com/mtz/images/mt-logo.png" alt="" class="img-responsive"></a>



      </nav>


<div >




<div class="col-md-6 nopad">

<div class="col-md-12 nopad" style="height: 90vh">
   <gm-map center="mapcenter" class="ui-map"  options="{zoom: 15}" ng-style="(orderInfo.status=='In-Progress')  ? {'opacity': '1'} :  {'opacity': '0.4'}" >




 <gm-marker

                            options="{position:[cust_lat,cust_lng],icon : {
    url: '/assets/images/Home.png',
    size: map.Size(50, 50),
    origin: maps.Point(0,0),
    anchor: maps.Point(0, 0)
}
}"  on-click="emp.showmarker = !emp.showmarker" >

 </gm-marker>


                                   <gm-marker ng-if="orderInfo.status=='In-Progress'"

                            options="{position:[emp_lat, emp_lng],icon : {
     url: '/assets/images/Vehicle.png',
    size: map.Size(50, 50),
    origin: maps.Point(0,0),
    anchor: maps.Point(0, 0)
}
}"  on-click="emp.showmarker = !emp.showmarker" >



                            </gm-marker>


       </gm-map>


       <h2  ng-if="(orderInfo.status=='Unallocated')" style="    text-align: center;
    font-size: 19px;
    z-index: 100;
    opacity: 1000;
    position: inherit;
    padding-top: 20%;
}"> Waiting For Delivery Agent Allocation </h2>



       <h2  ng-if="(orderInfo.status=='Allocated')" style="    text-align: center;
    font-size: 19px;
    z-index: 100;
    opacity: 1000;
    position: inherit;
    padding-top: 20%;
}"> Waiting For Delivery Agent Confirmation </h2>



<h2  ng-if="(orderInfo.status=='Canceled')" style="    text-align: center;
    font-size: 19px;
    z-index: 100;
    opacity: 1000;
    position: inherit;
    padding-top: 20%;
}"> Your Order Canceled </h2>


<h2  ng-if="(orderInfo.status=='Delivered')" style="    text-align: center;
    font-size: 19px;
    z-index: 100;
    opacity: 1000;
    position: inherit;
    padding-top: 20%;
}"> Your Order Delivered </h2>




<h2  ng-if="(orderInfo.status=='Incomplete')" style="    text-align: center;
    font-size: 19px;
    z-index: 100;
    opacity: 1000;
    position: inherit;
    padding-top: 20%;
}"> Your Order UnDelivered</h2>

</div>


</div>
<div class="col-md-6 nopad" style="height: 80vh">



<div class="col-md-12 nopad" style="background: #00316b;
    color: white;">

<h4 class="text-center"> Order Tracking #{{orderInfo.id}} </h4>





</div>

<div class="col-md-12 nopad">
 <md-card>


        <md-card-content ng-if="(orderInfo.status!='Unallocated') && (orderInfo.status!='Canceled')">
                        <p class="p2 ti">
                                Delivery Agent
                                </p>

  <img style="       width: 75px;
    height: 75px;
    border-radius: 50%;
    border-width: 3px;

 " ng-src="{{driver_image}}" class="md-avatar" />


                        <span style="    font-size: 25px;color: #00316b;">{{orderInfo.emp_info.first_name}} {{orderInfo.emp_info.last_name}} </span>

                    <span style="    font-size: 15px;color: #00316b;"> {{orderInfo.emp_info.phone}}   </span>

                        <div style="    display: inline-block;

    float: right;
    padding: 0px;
    margin: 15px;">




      <md-button class="md-fab md-primary" aria-label="Use Android" ng-if="orderInfo.status == 'Delivered'"  ng-click="showPrompt($event)" >
          <md-icon class="material-icons">rate_review</md-icon>
           <md-tooltip md-direction="top">Submit Review</md-tooltip>
      </md-button>



                   <md-button class="md-fab md-primary" aria-label="Use Android" ng-href="tel: {{orderInfo.emp_info.phone}}">
          <md-icon class="material-icons" >call</md-icon>

           <md-tooltip md-direction="top">Call Delivery Person</md-tooltip>
        </md-button>

        </div>

        </md-card-content>

      </md-card>

 <md-card >


        <md-card-content>
       <div class="col-md-12 nopad">

                                <p class="p2 ti">
                                Customer
                                </p>

                                      <p class="st">
                                                {{orderInfo.status}}
                                            </p>


                                 <p class="p2">

                       <md-icon style="      color: rgb(0, 50, 106);  font-size: 21px;
">
                                   person
                                   </md-icon>  {{orderInfo.cust_name}}
                                </p>


                                                                 <p class="p2">

                       <md-icon style="      color: rgb(0, 50, 106);  font-size: 21px;
">
                                   access_time
                                   </md-icon>  {{toUserTimeZone(orderInfo.schedule_date_time)}}
                                </p>





                                <p class="p2">
                                   <md-icon style="      color: rgb(0, 50, 106);  font-size: 21px;
">
                                   phone
                                   </md-icon>  +  {{orderInfo.cust_phone}}
                                </p>

                                <p>
                           <md-icon style="     color: rgb(0, 50, 106);   font-size: 21px;
">
                                   location_on
                                   </md-icon>

                                   {{orderInfo.cust_address}}
  </p>


<b>Items: </b>   ({{orderInfo.method}})<br/ >

          <p>
        {{orderInfo.notes}}
          </p>
                            </div>




      </md-card>



</div>



</div>



@endverbatim
</div>

           <script src="assets/app/core/app.recovery.js" type="text/javascript"></script>
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


    <script src="//maps.google.com/maps/api/js?key=AIzaSyDbQXFKrozmHshujYL_omIh2VIdYCmjUPk&libraries=places"></script>
     <script src="assets/app/core/angular-google-maps-native.js"></script>



<script type="text/javascript" src="//cdnjs.cloudflare.com/ajax/libs/socket.io/1.7.3/socket.io.min.js"></script>

 <script src="assets/app/core/echo.js" type="text/javascript"></script>



 
        <script src="//cdnjs.cloudflare.com/ajax/libs/moment.js/2.17.1/moment.min.js" type="text/javascript"></script>


<script type="text/javascript">
    var app = angular.module('app', ['ngAnimate'
        ,'ngAria'
        ,'ngMessages'
        ,'ngMaterial',
        ,'ngIntlTelInput'
        ,'LocalStorageModule'
        ,'GoogleMapsNative'
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


app.directive('starRating', function () {
    return {
        restrict: 'A',
        template: '<ul class="rating">' +
            '<li ng-repeat="star in stars" ng-class="star" ng-click="toggle($index)">' +
            '\u2605' +
            '</li>' +
            '</ul>',
        scope: {
            ratingValue: '=',
            max: '=',
            onRatingSelected: '&'
        },
        link: function (scope, elem, attrs) {

            var updateStars = function () {
                scope.stars = [];
                for (var i = 0; i < scope.max; i++) {
                    scope.stars.push({
                        filled: i < scope.ratingValue
                    });
                }
            };

            scope.toggle = function (index) {
                scope.ratingValue = index + 1;
                scope.onRatingSelected({
                    rating: index + 1
                });
            };

            scope.$watch('ratingValue', function (oldVal, newVal) {
                if (newVal) {
                    updateStars();
                }
            });
        }
    }
})

    app.controller('TrackingCtrl',function($scope, $http, $mdDialog,localStorageService)
    {


 function DialogController($scope, $mdDialog, $http,dataToPass) {


$scope.rating = 1;
$scope.desc = '';


if(dataToPass.length == 1)
{
$scope.rating = parseInt(dataToPass[0].stars);
$scope.desc = dataToPass[0].review;
}




  $scope.review = function()
  {
    if( $scope.rating &&  $scope.desc )
    {
    $http.post('', {
                data: {
                  "stars" : $scope.rating ,
                  "review" : $scope.desc
                }
            }).then(function(response) {


                $mdDialog.hide();


$mdDialog.show($mdDialog.alert().title('Thanks for Review').ok('OK'));


                }, function(response) {
                    // failure call back
                });
  }
  else
  {
        $scope.alert = 'Please Describe Your Experience ';
  }
  }
    $scope.hide = function() {
      $mdDialog.hide();
    };

    $scope.cancel = function() {
      $mdDialog.cancel();
    };

    $scope.answer = function(answer) {
      $mdDialog.hide(answer);
    };
  }


$scope.toUserTimeZone = function (date)
{
var date = moment.utc().format(date);
var stillUtc = moment.utc(date).toDate();
var local = moment(stillUtc).local().format('YYYY-MM-DD HH:mm:ss')
  
return local;
}




 $scope.showPrompt = function(ev) {
    $mdDialog.show({
      controller: DialogController,
      locals:{dataToPass: $scope.orderInfo.review},
      template: '<md-dialog>\
  <form ng-cloak ng-submit="review()">\
  <md-toolbar>\
      <div class="md-toolbar-tools">\
        <h2> <md-icon class="material-icons" style="    padding-right: 45px;">rate_review</md-icon>Rate and review</h2>\
        <span flex></span>\
        <md-button class="md-icon-button" ng-click="cancel()">\
          <md-icon aria-label="Close dialog">close</md-icon>\
        </md-button>\
      </div>\
    </md-toolbar>\
    <md-dialog-content>\
      <div class="md-dialog-content">\
        <h4>It only takes a minute! And your review will helps to improve our service </h4>\
        <p>\
         Overall Rating :  <div star-rating rating-value="rating" max="5" on-rating-selected="getSelectedRating(rating)"></div>\
         <md-input-container class="md-block">\
          <label>Describe your experience</label>\
          <textarea ng-model="desc" md-maxlength="150" rows="5" md-select-on-focus></textarea>\
        </md-input-container>\
\
@verbatim\
<h3> {{alert}} </h3>\
@endverbatim\
          <md-button type="submit" class="md-raised md-primary">Send</md-button>\
        </p>\
      </div>\
    </md-dialog-content>\
  </form>\
</md-dialog>',
      parent: angular.element(document.body),
      targetEvent: ev,
      clickOutsideToClose:true,
      fullscreen: $scope.customFullscreen
    })
    .then(function(answer) {
    }, function() {
    });
  };




        $scope.mapshow = false;

        $scope.mapcenter =  [0, -180];
       $scope.zoom = 5;

       $scope.driver_image = 'assets/images/person-icon-8.png';



       $scope.orderInfo = {!!$order_info!!};


        $scope.cust_lat =  parseFloat($scope.orderInfo.loc_lat);
       $scope.cust_lng  =parseFloat($scope.orderInfo.loc_lng);

       $scope.mapcenter = [$scope.cust_lat,
$scope.cust_lng];

if($scope.orderInfo)
{

  if($scope.orderInfo.emp_info)
  {
        if($scope.orderInfo.emp_info.geo)
        {
       if($scope.orderInfo.emp_info.geo.lat)
       {
           $scope.emp_lat = $scope.orderInfo.emp_info.geo.lat;
       }
         if($scope.orderInfo.emp_info.profile_image.length)
       {
           $scope.driver_image = $scope.orderInfo.emp_info.profile_image[0];
       }

          if($scope.orderInfo.emp_info.geo.lng)
       {
             $scope.emp_lng = $scope.orderInfo.emp_info.geo.lng;
       }
       if($scope.orderInfo.emp_info.timestamp)
       {
             $scope.timestamp = $scope.orderInfo.emp_info.geo.timestamp;
       }
     }



       setTimeout(function() {        $scope.$apply();}, 10);

}
      if($scope.orderInfo.status == 'Allocated' || $scope.orderInfo.status == 'In-Progress' )
      {
   $scope.mapshow  = true;

            window.Echo.private(globalapp.channel + 'tracking-customers-' +   $scope.orderInfo.emp_info.socket_id).listen('LocationUpdate', (e) => {


          $scope.emp_lat = e.data.lat;
          $scope.emp_lng =e.data.lng;
          $scope.timestamp =e.data.timestamp;
               setTimeout(function() {        $scope.$apply();}, 10);

                        })
    }
}
            });


</script>
        <!-- endinject -->
        <!-- endbuild -->
    </body>
</html>
