(function() {
    'use strict';

    angular.module('app').factory('api', api)

    //.factory('_', LodashFactory);
    // LodashFactory.$inject = ['$window'];

    // function LodashFactory($window) {
    //     if (!$window._) {
    //         // If lodash is not available you can now provide a
    //         // mock service, try to load it from somewhere else,
    //         // redirect the user to a dedicated error page, ...
    //     }
    //     return $window._;
    // }
    api.$inject = ['$http', '$base64', '$q', 'localStorageService','$mdDialog'];


    function api($http, $base64, $q, localStorageService,$mdDialog) {
        var base = '';
        var visit_types = ['Waiting for Approval', 'Approved', 'Un Approved'];
        var case_status = ['Waiting', 'Closed', 'Re Opened'];

           var schedule = [
           "Unallocated",
            "Allocated",
             "In-Progress",
           // "Delivered",
           "Incomplete",
           "Delivered",
           "Canceled",
        ];

        // "Unallocated",
        // "Allocated",
        // "On-Progress",
        // "Incomplete",
        // "Completed",
        // var schedule = ['Waiting', 'Closed', 'Re Opened'];
        var month = [
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July ',
    'August',
    'September',
    'October',
    'November',
    'December'
    ]

    var units = [
    "Grams",
    "Kilo Grams",
    "Tons"
    ]
        var place_type = [
        "Existing Customer",'New Customer',
        ];

        var method = ['Pickup','Drop'];
        var case_types = ['Product', 'Delivery', 'Billing', 'Physical', 'Others'];
        var order_status = ["Order Placed", "Payment Uncleared", "Payment Cleared", "Order Complete", "Order Canceled", "Order Problem", "Awaiting Stock", ];
        var email_rex = /^.+@.+\..+$/;
        var web_rex = /^http:\/\/|(www\.)?[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(:[0-9]{1,5})?(\/.*)?$/;
        var requesttype = ['Others', 'Credit limit', 'Price Approval', 'Discount Approval', 'Information Update'];
        var active = ['De Active', 'Active'];
        var companytype = ['Private', 'Sole Proprietorship', 'Limited Liability Company', 'Cooperative', 'Corporation', 'Partnership', 'S Corporation', ];
        var st = ['No', 'Yes'];
        var leave = ['Present', 'Leave'];
        var mapcenter = [13.0827, 80.2707];
        var scheduletypes = ['Normal Visit', 'Request', 'Take Order', 'Complaint'];
        var active = ['De Active', 'Active'];
        var gps_active = ['Off', 'On'];
        var dataerror = 'No Data Found on the Server';
        var networkerror = 'Network Issue Try again';
        var defaultmsg = 'System Busy';
        var salesman_role_id = 1;
        var manager_role_id = 2;
        var backend_role_id = 3;
        var emptymsg = '';
        var hashkey = 'sfa$#$#$+HashKEvf';
        var rootdomain = 'manageteamz.com';
        var uploadtypes = ['img', 'doc'];
        var service = {
            base: base,
            visit_types: visit_types,
            show_menu: show_menu,
            active: active,
            gps_active: gps_active,
            users: users,
            scheduletypes: scheduletypes,
            customers: customers,
            competitor: competitor,
            load: load,
            upload: upload,
            prospect: prospect,
            activity: activity,
            category: category,
            master_getDb: master_getDb,
            superAdmin: superAdmin,
            manager: manager,
            admin: admin,
            get_apiurl: get_apiurl,
            set_apiurl: set_apiurl,
            roles: roles,
            product: product,
            networkerror: networkerror,
            dataerror: dataerror,
            defaultmsg: defaultmsg,
            emptymsg: emptymsg,
            encode: encode,
            decode: decode,
            getemp_name: getemp_name,
            rootdomain: rootdomain,
            managers: managers,
            salesman_role_id: salesman_role_id,
            manager_role_id: manager_role_id,
            backend_role_id: backend_role_id,
            companytype: companytype,
            competitor: competitor,
            getcustomer_name: getcustomer_name,
            arrayObjectIndexOf: arrayObjectIndexOf,
            updateroots: updateroots,
            getrole: getrole,
            requesttype: requesttype,
            case_types: case_types,
            getproduct_name: getproduct_name,
            with_manager: st,
            attendance_type: leave,
            update_menu: update_menu,
            mapcenter: mapcenter,
            case_status: case_status,
            orders_data: orders_data,
            order_status: order_status,
            autogenrateno: autogenrateno,
            randomPassword: randomPassword,
            email_rex: email_rex,
            web_rex: web_rex,
            toggle_phone: toggle_phone,
            checkdups: checkdups,
            getSubDomain: getSubDomain,
            // updateDataTable: updateDataTable,
            month: month,
            units: units,
            method: method,
            parseGoogprofileleResponse : parseGoogleResponse,
            profile : profile,
            timeago : timeago,
            onlineTimeAgo : onlineTimeAgo,
            showDemoAlert : showDemoAlert,
            showDemoonceAlert : showDemoonceAlert,
            schedule : schedule,
            place_type : place_type,
                     SocketLeaveChannel : SocketLeaveChannel,
            SocketInit : SocketInit,
            SocketDisconnect : SocketDisconnect,
            CovertDateTime: CovertDateTime,
        };

        function CovertDateTime(date) {
                 if (date) {
                     if (date instanceof Object) {
                         if (!moment.isMoment(date)) {
                             date = moment(date);
                             return date.format('YYYY-MM-DD HH:mm');
                         } else {
                             return date.format('YYYY-MM-DD HH:mm');
                         }
                         if (date.startDate === null) {
                             return '';
                         }
                     }
                     date = moment(date);
                     return date.format('YYYY-MM-DD HH:mm');
                     return date;
                 } else {
                     return date;
                 }
             }


 function SocketDisconnect()
    {
         window.Echo = null;
    }


    function SocketLeaveChannel(channel)
    {
         window.Echo.leave(channel);
    }


    function SocketInit() {

     window.Echo = new EchoWs({
    broadcaster: 'socket.io',
    host: globalapp.socket_host
    });

    }

// // list of `state` value/display objects
//     $scope.states        = loadAll();
//     $scope.querySearch   = querySearch;

//     // ******************************
//     // Template methods
//     // ******************************


//       // $scope.selectedItem = {};

//       // $scope.selectedItem.value = 'hawai';
//       // $scope.selectedItem.display = 'Hawai';



//     // ******************************
//     // Internal methods
//     // ******************************

//     /**
//      * Search for states... use $timeout to simulate
//      * remote dataservice call.
//      */
//     function querySearch (query) {
//       return query ? $scope.states.filter( createFilterFor(query) ) : $scope.states;
//     }

//     /**
//      * Build `states` list of key/value pairs
//      */
//     function loadAll() {
//       var allStates = 'Alabama, Alaska, Arizona, Arkansas, California, Colorado, Connecticut, Delaware,\
//               Florida, Georgia, Hawaii, Idaho, Illinois, Indiana, Iowa, Kansas, Kentucky, Louisiana,\
//               Maine, Maryland, Massachusetts, Michigan, Minnesota, Mississippi, Missouri, Montana,\
//               Nebraska, Nevada, New Hampshire, New Jersey, New Mexico, New York, North Carolina,\
//               North Dakota, Ohio, Oklahoma, Oregon, Pennsylvania, Rhode Island, South Carolina,\
//               South Dakota, Tennessee, Texas, Utah, Vermont, Virginia, Washington, West Virginia,\
//               Wisconsin, Wyoming';

//       return allStates.split(/, +/g).map( function (state) {
//         return {
//           value: state.toLowerCase(),
//           display: state
//         };
//       });
//     }

//     /**
//      * Create filter function for a query string
//      */
//     function createFilterFor(query) {
//       var lowercaseQuery = angular.lowercase(query);

//       return function filterFn(state) {
//         return (state.value.indexOf(lowercaseQuery) === 0);
//       };

//     }


function showDemoonceAlert(state)
{


var check = [
'admin.user',
'admin.customer',
'admin.schedule',
'admin.report',
'admin.map',
'admin.customer-review',
// 'admin.travelmap',
'admin.mobileapp',
'admin.profile'

]
var url = state;

if(check.indexOf(url) == -1)
{
return;
}


if(!this.superAdmin())
{


var links = angular.fromJson(localStorageService.get('demo_links'));

if(links instanceof Array)
{

if(links.indexOf(url) !== -1) {

}
else
{
 $http.put('demo',{data : {"url" : url }}).success(function(data, status) {

    if (data.status === 'ok') {
localStorageService.set('demo_links',data.data.demo_links);
        }

 });
showDemoAlert(state);
}



}

}

}

function showDemoAlert (state) {

console.log('triger');

    // if(window.location.hash)
    // {
      var  url = 'demo?url='+state;
    // }

var ev = '';
       $mdDialog.show({
      controller: function ($scope, $mdDialog,$http) {

  $scope.close = function() {

    $mdDialog.cancel();

  };



},
      templateUrl: url,
      parent: angular.element(document.body),
      targetEvent: ev,
      clickOutsideToClose:false,
      // fullscreen: useFullScreen
    })
    }

    function timeago (time, local, raw) {
            if (!time) return "never";

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

            if (offset <= MINUTE)              span = [ '', raw ? 'now' : 'few secs' ];
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


    function onlineTimeAgo (time, local, raw) {
            if (!time) return "Off line";

            if (!local) {
                (local = Date.now())
            }

           var time = moment(time).toDate();

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

            if (offset <= MINUTE)              span = [ '', raw ? 'now' : 'few secs' ];
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


function parseGoogleResponse(components) {

    var data = {

        street : "",
        street_number : "",
        city : "",
        country : "",
        postal_code : "",

    };

    _.each(components, function(component) {
      _.each(component.types, function(type) {


        if (type === 'route') {
          data.street = component.long_name;
        }
        if (type === 'street_number') {
         data.street_number = component.long_name;
        }
        if (type === 'locality') {
           data.city = component.long_name;
        }
        if (type === 'country') {
          data.country = component.long_name;
        }
        if (type === 'postal_code') {
           data.postal_code = component.long_name;
        }
      })
    })

    return data;
  }






function checkdups(array,key,int)
{

    int = int  || 0;





var valueArr = array.map(function(item){


console.log(item)

if(int == 'int')
{
     return  parseInt(item[key])
}
else
{
     return  item[key]
}





});



var isDuplicate = valueArr.some(function(item, idx){
    return valueArr.indexOf(item) != idx
});

return isDuplicate;
}




        //  function updateDataTable() {
        //     $scope.wwstatus = false;
        //     var filter = false; //set filter false
        //     for (var j = 0; j < $scope.multisearch.length; j++) {
        //         if ($scope.multisearch[j].ident && $scope.multisearch[j].column) {
        //             filter = true; //if a filter exists
        //         }
        //     }
        //     if (filter) { //if a filter is set
        //         if (w) {
        //             w.terminate();
        //         }
        //         w = new Worker("assets/app/core/filter.js");
        //         w.postMessage({
        //             multisearch: $scope.multisearch,
        //             datatable: angular.copy(original), //copy the original,
        //             smart: $scope.smart
        //         });
        //         w.onmessage = function(event) {
        //             $scope.datatable = event.data;
        //             $scope.wwstatus = true;
        //             $scope.$digest();
        //         };
        //     } else {
        //         $scope.wwstatus = true;
        //         $scope.datatable = angular.copy(original);
        //     }
        // }


        function randomPassword(length) {
            var chars = "abcdefghijklmnopqrstuvwxyz!@#$%^&*()-+<>ABCDEFGHIJKLMNOP1234567890";
            var pass = "";
            for (var x = 0; x < length; x++) {
                var i = Math.floor(Math.random() * chars.length);
                pass += chars.charAt(i);
            }
            return pass
        }

        function updateroots() {
            if (superAdmin()) {
                var token = localStorageService.get('update');
                if (token === 'yes') {
                    localStorageService.set('update', 'no');
                    return true;
                }
            }
            return false;
        }

        function orders_data() {
            return service.load('order/');
        }

        function autogenrateno() {
            return Math.floor((Math.random() * 10000) + 1);
        }


        function toggle_phone()
        {
                console.log('hi')
        }
        function show_menu() {
            if (superAdmin()) {
                return localStorageService.get('show_menu');
            }
            return true;
        }

        function update_menu(value) {
            if (superAdmin()) {
                var t = localStorageService.set('show_menu', value);
            }
        }

        function arrayObjectIndexOf(arr, obj) {
            for (var i = 0; i < arr.length; i++) {
                if (angular.equals(arr[i], obj)) {
                    return i;
                }
            };
            return -1;
        }

        function getemp_name(id) {
            return service.load('user/' + id);
        }

        function getproduct_name(id) {
            return service.load('product/' + id);
        }

        function getcustomer_name(id) {
            return service.load('customer/' + id);
        }

        function competitor() {
            return service.load('competitor');
        }

        function encode(value) {
            value = value + hashkey;
            try {
                return $base64.encode(unescape(encodeURIComponent(value)));
            } catch (err) {
                alert('Js Expection : Can not encode this string');
            }
        }

        function decode(value) {
            try {
                return decodeURIComponent(escape($base64.decode(value).replace(hashkey, '')));
            } catch (err) {
                alert('Js Expection : Can not Decode this string');
            }
        }

        function img(url) {
            var url = 'dashboard/uploads/' + url;
            return url;
        }

        function getrole() {
            return localStorageService.get('role');
        }

        function superAdmin() {
            var token = localStorageService.get('role');
            if (token === 'super_admin') {
                return true;
            } else {
                return false;
            }
        }

        function managers() {
            return service.load('managers');
        }

        function profile() {
            return service.load('profile');
        }
        function product() {
            return service.load('product');
        }

        function competitor() {
            return service.load('competitor');
        }

        function activity() {
            return service.load('activity');
        }

        function manager() {
            var token = localStorageService.get('role');
            if (token === 'manager') {
                return true;
            } else {
                return false;
            }
        }

        function admin() {
            var token = localStorageService.get('role');
            if (token === 'admin') {
                return true;
            } else {
                return false;
            }
        }

        function upload(info, type = false) {
            var url = 'upload';
            if (type) {
                url = url + '?type=' + type;
            }
            var promise = function() {
                var defer = $q.defer();
                var formData = new FormData();
                angular.forEach(info, function(obj) {
                    formData.append('files[]', obj.lfFile);
                });
                $http.post(url, formData, {
                    transformRequest: angular.identity,
                    headers: {
                        'Content-Type': undefined
                    }
                }).then(function(result) {
                    defer.resolve(result.data);
                }, function(response) {
                    defer.reject(response);
                });
                return defer.promise;
            }
            return promise;
        }

        function load(url, root) {
            root = root || false;
            if (root) {
                var promise = function() {
                    var defer = $q.defer();
                    $http.get(url, {
                        headers: {
                            'x-sub-root-domain': document.location.host
                        }
                    }).then(function(response) {
                        defer.resolve(response.data);
                    }, function(response) {
                        defer.reject(response);
                    });
                    return defer.promise;
                };
            } else {
                var promise = function() {
                    var defer = $q.defer();
                    $http.get(url).then(function(response) {
                        defer.resolve(response.data);
                    }, function(response) {
                        defer.reject(response);
                    });
                    return defer.promise;
                };
            }
            return promise;
        }

        function users() {
            return service.load('user?active=yes');
        };

        function customers() {
            return service.load('customer');
        }

        function master_getDb() {
            return service.load('master_getDb', true);
        }

        function get_apiurl() {
            return localStorageService.get('apiurl')
        }

        function getSubDomain() {

            return globalapp.getSubdomain(localStorageService.get('apiurl'));

        }

        function set_apiurl(url, t = true) {
            if (t) {
                localStorageService.set('apiurl', url);
            } else {
                localStorageService.set('apiurl', '//' + url);
            }
        }

        function activity() {
            return service.load('activity');
        }

        function prospect() {
            return service.load('prospect');
        }

        function category() {
            return service.load('category');
        }

        function roles() {
            return service.load('user_roles');
        }
        if (superAdmin() && localStorageService.get('show_menu') == null) {
            localStorageService.set('show_menu', true);
        } else {
            localStorageService.set('show_menu', true);
        }
        return service;
    }
})();
