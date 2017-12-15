(function () {
    'use strict';

    angular.module('app', [
        // Angular modules
         'ui.router'
        ,'ngAnimate'
        ,'ngSanitize'
        ,'ngCsv'
        ,'ngAria'
        ,'ngMessages'
        ,'ngMaterial'

        ,'base64'
        ,'app.layout'
        ,'app.ui'
        // ,'ui.calendar'
        ,'md.data.table'
        ,'GoogleMapsNative'
        ,'angular.filter'
        ,'lfNgMdFileInput'
        ,'LocalStorageModule'
        ,'ngIntlTelInput'
        ,'mdLightbox'
        ,'permission'
        ,'permission.ui',
        ,'unsavedChanges'
        ,'ngMaterialDatePicker'
        ,'daterangepicker'





    ]);



})();





angular.module('app')

.directive('myEnter', function () {
    return function (scope, element, attrs) {
        element.bind("keydown keypress", function (event) {
            if(event.which === 13) {
                scope.$apply(function (){
                    scope.$eval(attrs.myEnter);
                });

                event.preventDefault();
            }
        });
    };
})


// .directive('fallbackSrc', function () {
//   var fallbackSrc = {
//     link: function postLink(scope, iElement, iAttrs) {
//       iElement.bind('error', function() {
//         angular.element(this).attr("src", iAttrs.fallbackSrc);
//       });
//     }
//    }
//    return fallbackSrc;
// })

.filter('dateToISO', function() {
  return function(badTime) {
    var goodTime = moment(badTime).format('hh:mm A');
    return goodTime;
  };
})
.filter('dateForm', function() {
  return function(badTime) {
    var goodTime = moment(badTime).format('YYYY-MM-DD hh:mm A');
    return goodTime;
  };
})

.filter('dateFill', function() {
  return function(badTime) {
    var goodTime = moment(badTime).format('Do MMM YY, h:mm A');
    return goodTime;
  };
})


.directive('starRating', function () {
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
            readonly: '=',
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


                if(!scope.readonly)
                {
                     scope.ratingValue = index + 1;
                scope.onRatingSelected({
                    rating: index + 1
                });
              }
            };

            scope.$watch('ratingValue', function (oldVal, newVal) {
                if (newVal) {
                    updateStars();
                }
            });
        }
    }
})


.filter('truncate', function() {
  return function(text, length, end) {
    if (isNaN(length))
      length = 10;

    if (end === undefined)
      end = "...";

    if (text.length <= length || text.length - end.length <= length) {
      return text;
    } else {
      return String(text).substring(0, length - end.length) + end;
    }

  };
})
  .filter('sumOfValue', function() {
    return function(data, key) {
      if (angular.isUndefined(data) || angular.isUndefined(key))
        return 0;
      var sum = 0;

      angular.forEach(data, function(v, k) {

        if(parseFloat(v[key]))
        {
             sum = sum + parseFloat(v[key]);
        }

      });

      return sum.toFixed(2);
    }
  }).filter('totalSumPriceQty', function() {
    return function(data, key1, key2) {
      if (angular.isUndefined(data) || angular.isUndefined(key1) || angular.isUndefined(key2))
        return 0;

      var sum = 0;
      angular.forEach(data, function(v, k) {
        sum = sum + (parseFloat(v[key1]) * parseFloat(v[key2]));
      });
      return sum.toFixed(2);
    }
  })


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
      }])


   .filter("timeago", function () {
        //time: the time
        //local: compared to what time? default: now
        //raw: wheter you want in a format of "5 minutes ago", or "5 minutes"
        return function (time, local, raw) {
            if (!time) return "not yet";

            if (!local) {
                (local = Date.now())
            }

            if (angular.isDate(time)) {
                time = time.getTime();
            } else if (typeof time === "string") {
                time = new Date(time).getTime();
            }

            if (angular.isDate(local)) {
                local = local.getTime();
            }else if (typeof local === "string") {
                local = new Date(local).getTime();
            }

            if (typeof time !== 'number' || typeof local !== 'number') {
                return;
            }

            var
                offset = Math.abs((local - time) / 1000),
                span = [],
                MINUTE = 60,
                HOUR = 3600,
                DAY = 86400,
                WEEK = 604800,
                MONTH = 2629744,
                YEAR = 31556926,
                DECADE = 315569260;

            if (offset <= MINUTE)              span = [ '', raw ? 'now' : 'now' ];
            else if (offset < (MINUTE * 60))   span = [ Math.round(Math.abs(offset / MINUTE)), 'min' ];
            else if (offset < (HOUR * 24))     span = [ Math.round(Math.abs(offset / HOUR)), 'hr' ];
            else if (offset < (DAY * 7))       span = [ Math.round(Math.abs(offset / DAY)), 'day' ];
            else if (offset < (WEEK * 52))     span = [ Math.round(Math.abs(offset / WEEK)), 'week' ];
            else if (offset < (YEAR * 10))     span = [ Math.round(Math.abs(offset / YEAR)), 'year' ];
            else if (offset < (DECADE * 100))  span = [ Math.round(Math.abs(offset / DECADE)), 'decade' ];
            else                               span = [ '', 'a long time' ];

            span[1] += (span[0] === 0 || span[0] > 1) ? 's' : '';
            span = span.join(' ');

            if (raw === true) {
                return span;
            }
            return (time <= local) ? span + ' ago' : 'in ' + span;
        }
    })

.directive('googleplace', function() {
    return {
        require: 'ngModel',
        scope: {
            ngModel: '=',
            details: '=?'
        },
        link: function(scope, element, attrs, model) {
            var options = {
               // types: [],
               // componentRestrictions: {}
            };
            scope.gPlace = new google.maps.places.Autocomplete(element[0], options);

            google.maps.event.addListener(scope.gPlace, 'place_changed', function() {
                scope.$apply(function() {
                    scope.details = scope.gPlace.getPlace();
                    model.$setViewValue(element.val());
                });
            });
        }
    };
})


.directive('yearSelect',function(){
    var currentYear = new Date().getFullYear();
    return {
      restrict: 'AE',
      replace: true,
      scope:{   },
        template: '<select ng-options="y for y in years"></select>',
        controller: ["$scope", "$element", "$attrs", function (scope, element, attrs) {

            scope.years = [];
            for (var i = (attrs.offset*1); i < (attrs.range*1) + 1; i++){
                scope.years.push(currentYear + i);
            }
            // $scope.selected = moment().year();
        }]
    }
})

.directive('stringToNumber', function() {
  return {
    require: 'ngModel',
    link: function(scope, element, attrs, ngModel) {
      ngModel.$parsers.push(function(value) {
        return '' + value;
      });
      ngModel.$formatters.push(function(value) {
        return parseFloat(value);
      });
    }
  };
})



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
    }]);


  (function(){var a;a=angular.module("daterangepicker",[]),a.constant("dateRangePickerConfig",{clearLabel:"Clear",locale:{separator:" - ",format:"YYYY-MM-DD"}}),a.directive("dateRangePicker",["$compile","$timeout","$parse","dateRangePickerConfig",function(a,b,c,d){return{require:"ngModel",restrict:"A",scope:{min:"=",max:"=",model:"=ngModel",opts:"=options",clearable:"="},link:function(a,b,c,e){var f,g,h,i,j,k,l,m,n,o,p,q,r,s;return i=function(){var a,b;return b=angular.extend.apply(angular,Array.prototype.slice.call(arguments).map(function(a){return null!=a?a.locale:void 0}).filter(function(a){return!!a})),a=angular.extend.apply(angular,arguments),a.locale=b,a},r=$(b),q=a.opts,s=i({},d,q),j=null,f=function(){return j.setStartDate(),j.setEndDate()},k=function(a){return function(b){return j&&b?a(moment(b)):void 0}},m=k(function(a){return j.endDate<a&&j.setEndDate(a),s.startDate=a,j.setStartDate(a)}),l=k(function(a){return j.startDate>a&&j.setStartDate(a),s.endDate=a,j.setEndDate(a)}),n=function(a){return function(b,c){return b&&c?a(moment(b),moment(c)):!0}},p=n(function(a,b){return a.isBefore(b)||a.isSame(b,"day")}),o=n(function(a,b){return a.isAfter(b)||a.isSame(b,"day")}),e.$formatters.push(function(a){var b;return b=function(a){return moment.isMoment(a)?a.format(s.locale.format):moment(a).format(s.locale.format)},s.singleDatePicker&&a?b(a):a.startDate?[b(a.startDate),b(a.endDate)].join(s.locale.separator):""}),e.$render=function(){return e.$modelValue&&e.$modelValue.startDate?(m(e.$modelValue.startDate),l(e.$modelValue.endDate)):f(),r.val(e.$viewValue)},e.$parsers.push(function(a){var b,c,d;return b=function(a){return moment(a,s.locale.format)},c={startDate:null,endDate:null},angular.isString(a)&&a.length>0&&(s.singleDatePicker?c=b(a):(d=a.split(s.locale.separator).map(b),c.startDate=d[0],c.endDate=d[1])),c}),e.$isEmpty=function(a){return!(angular.isString(a)&&a.length>0)},g=function(){var b,c;r.daterangepicker(angular.extend(s,{autoUpdateInput:!1}),function(b,c){return a.$apply(function(){return a.model=s.singleDatePicker?b:{startDate:b,endDate:c}})}),j=r.data("daterangepicker"),c=[];for(b in s.eventHandlers)c.push(r.on(b,function(b){var c;return c=b.type+"."+b.namespace,a.$evalAsync(s.eventHandlers[c])}));return c},g(),a.$watch("model.startDate",function(a){return m(a)}),a.$watch("model.endDate",function(a){return l(a)}),h=function(b,d,f,h){return c[b]?(e.$validators[b]=function(a){return a&&d(s[h],a[f])},a.$watch(b,function(a){return s[h]=a?moment(a):!1,g()})):void 0},h("min",p,"startDate","minDate"),h("max",o,"endDate","maxDate"),c.options&&a.$watch("opts",function(a){return s=i(s,a),g()},!0),c.clearable&&a.$watch("clearable",function(b){return b&&(s=i(s,{locale:{cancelLabel:s.clearLabel}})),g(),b?r.on("cancel.daterangepicker",function(){return a.$apply(function(){return a.model=s.singleDatePicker?null:{startDate:null,endDate:null}})}):void 0}),a.$on("$destroy",function(){return null!=j?j.remove():void 0})}}}])}).call(this);
//# sourceMappingURL=angular-daterangepicker.min.js.map


angular.module('app').directive('sfaObject', function() {




    return {
          restrict: 'E',
          replace : true,
          link: function(scope, element, attrs ,ctrl) {

              element.html(fileview(attrs.url));
            return;
          }

    };


    function parseFileType(name) {



    var isImageType = function( name) {
        return name.match(/\.(gif|png|jpe?g)$/i) ? true : false;
};

var isVideoType = function(name) {
    return name.match(/\.(og?|mp4|webm|3gp)$/i) ? true : false;
};

var isAudioType = function(name) {
    return name.match(/\.(ogg|mp3|wav)$/i) ? true : false;
};



if (isImageType(name)) {
    return "image";
} else if (isVideoType(name)) {
    return "video";
} else if (isAudioType(name)) {
    return "audio";
}

return "object";
}


function fileview(filename) {


    var filetype = parseFileType(filename);



    var tplPreview = '';

    if (filetype == 'image') {

        tplPreview = '<img style="width: 100%; height: 100%;" md-lightbox  md-lightbox-title=' + filename + '  src="' + filename + '" >';

    } else if (filetype == 'video') {

        tplPreview = ['<video controls style="width: 100%; height: 100%;" >',
            '<source  src="' + filename + '" type="' + filetype + '">',
            '</video>'
        ].join('');

    } else if (filetype == 'audio') {

        tplPreview = ['<audio controls style="width: 100%; height: 100%;" >',
            '<source src="' + filename + '" type="' + filetype + '">',
            '</audio>'
        ].join('');

    } else {

        tplPreview = ['<object style="width: 100%; height: 100%;"  data="' + filename + '" type="' + filetype + '"><param name="movie" value="' + filename + '" />',
            '<div class="lf-ng-md-file-input-preview-default">',
            '<md-icon class="lf-ng-md-file-input-preview-icon" ng-class="strUnknowIconCls"></md-icon>',
            '</div>',
            '</object>'
        ].join('');

    }


    return tplPreview;




}

})




;
