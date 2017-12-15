<!DOCTYPE html>
<html data-ng-app="app" lang="en" ng-controller="AppCtrl" ng-cloak>
    <head>
        <meta content="text/html;charset=utf-8" http-equiv="content-type" />
        <meta charset="utf-8" />
        <meta name="fragment" content="!" />
        <title>
            SFA Dashboard
        </title>
        <base href="/dashboard/" />
        <meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0" name="viewport" />
        <meta content="yes" name="apple-mobile-web-app-capable" />
        <meta content="yes" name="apple-touch-fullscreen" />


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

            
                     <link href="styles/loader.css" rel="stylesheet">
                    <link href="//fonts.googleapis.com/icon?family=Material+Icons " rel="stylesheet" type="text/css"/>
                    <link href="//cdnjs.cloudflare.com/ajax/libs/angular-material/1.1.3/angular-material.min.css" rel="stylesheet" type="text/css"/>
                    
<link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/bootstrap-daterangepicker/2.1.13/daterangepicker.min.css" />
                 <!--    <link href="//cdnjs.cloudflare.com/ajax/libs/intl-tel-input/11.0.7/css/intlTelInput.css" rel="stylesheet" type="text/css">
                    </link> -->
                    <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/intl-tel-input/6.0.6/css/intlTelInput.css">

                    <link href="bower_components/lf-ng-md-file-input/dist/lf-ng-md-file-input.css" rel="stylesheet">
                    </link>
                    <link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
                    <link href="styles/layout.css" rel="stylesheet" type="text/css"/>
                    <link href="styles/theme.css" rel="stylesheet" type="text/css"/>
                    <link href="styles/ui.css" rel="stylesheet" type="text/css"/>
                    <link href="styles/app.css" rel="stylesheet" type="text/css"/>
   
                

    </head>
    <body id="body" ng-class="{
            'fixed-header'  : app.fixedHeader,
            'nav-collapsed' : app.navCollapsed,
            'nav-behind'    : app.navBehind,
            'layout-boxed'  : app.layoutBoxed,
            'theme-gray'    : app.theme == 'gray',
            'theme-dark'    : app.theme == 'dark',
            'sidebar-sm'    : app.sidebarWidth == 'small',
            'sidebar-lg'    : app.sidebarWidth == 'large'
    }">


<!--     <div class="loading" data-loading >
        
          <svg class="spinner" height="65px" viewbox="0 0 66 66" width="65px" xmlns="http://www.w3.org/2000/svg">
                <circle class="path" cx="33" cy="33" fill="none" r="30" stroke-linecap="round" stroke-width="6">
                </circle>
            </svg>
    </div>

 -->

        <div id="loader-container" data-loading>
            <svg class="spinner" height="65px" viewbox="0 0 66 66" width="65px" xmlns="http://www.w3.org/2000/svg">
                <circle class="path" cx="33" cy="33" fill="none" r="30" stroke-linecap="round" stroke-width="6">
                </circle>
            </svg>
        </div>
        <!--  <div ui-preloader></div> -->
        <div class="full-height {{app.pageTransition.class}}" ui-view="">
        </div>

        <script src="app/core/app.recovery.js" type="text/javascript"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/2.2.4/jquery.min.js" type="text/javascript"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/angular.js/1.5.8/angular.min.js" type="text/javascript"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/angular.js/1.5.8/angular-animate.min.js" type="text/javascript"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/angular.js/1.5.8/angular-aria.min.js" type="text/javascript"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/angular.js/1.5.8/angular-messages.min.js" type="text/javascript"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/offline-js/0.7.18/offline.min.js" type="text/javascript"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/fingerprintjs2/1.5.0/fingerprint2.min.js" type="text/javascript"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/angular-ui-router/0.4.2/angular-ui-router.min.js" type="text/javascript"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/angular-material/1.1.3/angular-material.min.js" type="text/javascript"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/jQuery-slimScroll/1.3.8/jquery.slimscroll.min.js" type="text/javascript"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/angular-scroll/1.0.0/angular-scroll.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/angular-permission/5.2.1/angular-permission.min.js" type="text/javascript"></script>
        <!-- <script src="//cdnjs.cloudflare.com/ajax/libs/angular-permission/5.2.1/angular-permission-ui.min.js" type="text/javascript"></script> -->

        <script type="text/javascript" src="app/core/angular-permission-ui.js"></script>
        <!-- Angular Material Fileinput -->
        <script src="bower_components/lf-ng-md-file-input/dist/lf-ng-md-file-input.js"></script>
        <!-- Angular Phone number -->
        <script src="//cdnjs.cloudflare.com/ajax/libs/intl-tel-input/6.0.6/lib/libphonenumber/build/utils.js" type="text/javascript"></script>


        <script src="//cdnjs.cloudflare.com/ajax/libs/intl-tel-input/6.0.6/js/intlTelInput.min.js" type="text/javascript"></script>

        <script src="https://cdnjs.cloudflare.com/ajax/libs/angular-material-data-table/0.10.10/md-data-table.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/angular-base64/2.0.5/angular-base64.min.js" type="text/javascript"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/angular-validation/1.4.3/angular-validation.min.js" type="text/javascript"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/angular-local-storage/0.5.2/angular-local-storage.min.js" type="text/javascript"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/moment.js/2.17.1/moment.min.js" type="text/javascript"></script>


        <script src="app/core/app.module.js"></script>
        <script src="app/layout/layout.module.js"></script>
        <script src="app/core/app.config.js"></script>
        <script src="app/core/datetimepicker.js"></script>
        <script src="app/login/login.controller.js"></script>
        <script src="app/logout/logout.controller.js"></script>
        <script src="app/data/data.js"></script>
        <script src="app/dashboard/dashboard.controller.js"></script>
        <script src="app/admin-dashboard/dashboard.controller.js"></script>

        <script src="app/company/company.controller.js"></script>
        <script src="app/company/company.view.controller.js"></script>


        <script src="app/customer-stats/customer-stats.controller.js"></script>
        <script src="app/customer-stats/customer-stats.view.controller.js"></script>


 <script src="//cdnjs.cloudflare.com/ajax/libs/bootstrap-daterangepicker/2.1.13/daterangepicker.min.js"></script>

        <script src="app/customer/customer.controller.js"></script>
        <script src="app/customer/customer.view.controller.js"></script>
        <script src="app/visit-report/visit-report.controller.js"></script>
        <script src="app/visit-report/visit-report.view.controller.js"></script>
        <script src="app/user/user.controller.js"></script>
        <script src="app/user/user.view.controller.js"></script>
        <script src="app/competitor/competitor.controller.js"></script>
        <script src="app/competitor/competitor.view.controller.js"></script>
        <script src="app/activities/activities.controller.js"></script>
        <script src="app/prospect/prospect.controller.js"></script>
        <script src="app/category/category.controller.js"></script>
        <script src="app/product/product.controller.js"></script>
        <script src="app/product/product.view.controller.js"></script>
        <script src="app/request-info/request-info.controller.js"></script>
        <script src="app/request-info/request-info.view.controller.js"></script>
        <script src="app/case-info/case-info.file.controller.js"></script>
        <script src="app/case-info/case-info.controller.js"></script>
        <script src="app/case-info/case-info.view.controller.js"></script>
        <script src="app/new-project-opp/new-project-opp.controller.js"></script>
        <script src="app/new-project-opp/new-project-opp.view.controller.js"></script>
        <script src="app/market-intelligence/market-intelligence.controller.js"></script>
        <script src="app/market-intelligence/market-intelligence.view.controller.js"></script>
        <script src="app/travel-expense/travel-expense.controller.js"></script>
        <script src="app/travel-expense/travel-expense.view.controller.js"></script>
        <script src="app/attandance/attandance.controller.js"></script>
        <script src="app/attandance/attandance.view.controller.js"></script>
        <script src="app/schedule/schedule.controller.js"></script>
        <script src="app/profile/profile.controller.js"></script>
        <script src="app/schedule/schedule.view.controller.js"></script>
        <script src="app/core/app.controller.js"></script>
        <script src="app/core/config.route.js"></script>
        <script src="app/layout/layout.directive.js"></script>
        <script src="app/core/md-light-box-module.js"></script>
        <script src="app/layout/loader.js"></script>
        <script src="app/layout/sidenav.controller.js"></script>
        <script src="//maps.google.com/maps/api/js?key=AIzaSyDbQXFKrozmHshujYL_omIh2VIdYCmjUPk&libraries=places"></script>
        <script src="app/core/place-autocomplete-module.js"></script>
        <script src="app/core/angular-google-maps-native.js"></script>
        <script src="app/core/unsavedChanges.js"></script>
        <script type="text/javascript" src="//cdnjs.cloudflare.com/ajax/libs/angular-filter/0.5.15/angular-filter.min.js"></script>
        <script src="app/order/order.controller.js"></script>
        <script src="app/order/order.view.controller.js"></script>
        <script src="" type="text/javascript"></script>
        <script src="app/dev/dev.js"></script>
        <script src="app/dev/devview.js"></script>
        <script src="app/map/map.controller.js"></script>
        <script src="app/travel-map/travel-map.controller.js"></script>
        <script src="bower_components/fullcalendar/dist/fullcalendar.min.js"></script>
        <script src="bower_components/angular-ui-calendar/src/calendar.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/fastclick/1.0.6/fastclick.min.js" type="text/javascript"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/chance/1.0.4/chance.min.js" type="text/javascript"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/lodash.js/4.17.4/lodash.min.js" type="text/javascript"></script>
        <!-- endinject -->
        <!-- endbuild -->
    </body>
</html>