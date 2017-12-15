<?php

Route::get('/', function () {
    return '<h1 style="text-align: center;
    text-transform: uppercase;
    margin-top: 50px;">Laravel Running</h1>';
});


Route::get('/dashboard/signup', function () {
    return view('register');
});







// Route::get('/dashboard/setapitokens/{apikey}/{token)/', function () {
//     return view('register');
// });






Route::get('/dashboard/register', function () {
    return view('signup');
});


Route::get('/dashboard/login-test', function () {
    return view('login');
});

Route::get('/dashboard/login', function () {
    return view('newlogin');
});

Route::get('/dashboard/forgot', function () {
    return view('newforgot');
});

Route::get('/dashboard/short/{longUrl}',"Base@GoogleShortner");
Route::get('/dashboard/sms/',"Base@TestSendSms");
Route::get('/api/fire1/',"Base@testkali");


Route::get('/dashboard/job-test',function()
{

echo "Task Initiated";
dispatch(new \App\Jobs\JobDemo(['google.com'],\App\Http\Controllers\Base::get_domin()));

     \Illuminate\Support\Facades\Log::info('Complete');
});

Route::get('/dashboard/sms/test',function()
{

});



Route::put('/dashboard/signup','CreateAccountsController@createEmp');
Route::get('/dashboard/github', 'SocialLoginController@redirectToProvider');
Route::get('/api/callback_auth', 'SocialLoginController@handleProviderCallback');
Route::post('api/forget','ForgotPasswordController@sendmail');
Route::get('/api/fire', function () {
    // this fires the event
    print_r(event(new App\Events\LocationUpdate()));
    return "event fired";
});



Route::get('/dashboard/socket','Base@testkali');




Route::get('/api/track-order/{order_id}','CustomerLiveTrackingController@show');

Route::post('/api/track-order/{order_id}', 'ReviewController@CustomerReview');



Route::get('/api/setapitokens/', function (\Illuminate\Http\Request $request) {

echo '<script>


if (typeof(Storage) !== "undefined") {

  localStorage.setItem("app_sfa.apitoken", "'.$request->input('token').'");
  localStorage.setItem("app_sfa.client-data","'.$request->input('client_token').'");
  localStorage.setItem("app_sfa.demo_links", "[]");
localStorage.setItem("app_sfa.role","'.$request->input('role').'");


} else {

 alert("Local Storage not supported try different browser");
}

 window.location="/dashboard/#/app/user";
</script>

';
    // $request->input('client_token')
    // $request->input('token')
    // $request->input('demo_links')


});



Route::get('/dashboard', function () {
    return view('app');
});

Route::group(array('prefix' => 'api'), function () {




    Route::get('logo', 'Base@getLogo');

    Route::get('GPSDataClean', 'LocationApi@GPSDataClean');


    Route::get('demo', 'DemoController@getContentbyHash');
    Route::get('demo_url', 'DemoController@getAllUrlSeen');
    Route::put('demo', 'DemoController@AddUrlToSeenList');

    // Broadcast routes
    Route::post('broadcastAuth','Base@broadcastAuth');

    Route::get('/testter', function () {
        return App\Http\Controllers\Base::touser('completed',true);
    });

    Route::get('test', 'Base@check_client_data');
    Route::get('db-init', 'Base@up_db');

        Route::get('GetMyNotifications', 'MyNotificationsController@GetNotifications');
        Route::get('ReadMyNotifications/{id}', 'MyNotificationsController@ReadNotifications');


    Route::get('hash', function () {

        echo decrypt('eyJpdiI6InR1UzNsNnBQbmVJY3NCcDYrUWRBMGc9PSIsInZhbHVlIjoieFJjUG9kSVc5UlNSeTNybDJJTlJoQT09IiwibWFjIjoiZTM2ZGU0MDUyMTM2ZGI4NzgwNTBkYTg0ZWU0Y2ZhNDQwNmM3ZWViNDJjMDc0NmU3NDRkZDY4NGJiZDJhYTU4NSJ9');

        echo encrypt('test');


    });



    Route::get('salt', 'Base@getTaskByModel');

    Route::get('location/all', 'LocationController@GetAllCompany');

    Route::resource('dbaudits', 'DBLogAuditsController');

    // Geo dev
    Route::get('geo', 'GeoController');

    Route::get('code', 'Base@code');

    Route::get('notify', 'NotificationsController@triggers');


    // app routes

    Route::post('auth', 'Base@web_auth');

    Route::post('logout', 'Base@logout');

    Route::get('uploads/{folder}/{name}', 'FileController@get');

    Route::get('country', 'DropDownDataController@country');
    Route::get('state', 'DropDownDataController@state');
    Route::get('city', 'DropDownDataController@city');

       Route::post('jserror', 'Base@create_jserror');

        Route::get('jserror', 'Base@get_jserror');

    Route::group(['middleware' => ['AuthHeader']], function () {

        // Resource Routes to Handle the api calls

        Route::resource('company', 'CompanyController');

        //Find out the js issues
        // Route::post('jserror', 'Base@create_jserror');

        // Route::get('jserror', 'Base@get_jserror');

        //

         Route::get('travel-clear', 'LocationApi@TravelClear');



        Route::delete('uploads/{folder}/{name}', 'FileController@fileDelete');
        Route::post('delete_files', 'FileController@fileDeletebulk');

        Route::resource('customer', 'CustomersController');

        Route::resource('visit', 'VisitReportController');

        Route::get('visit_rep_cmp', 'VisitReportController@visit_rep_cmp');

        Route::resource('competitor', 'CompetitorController');

        Route::resource('product', 'ProductController');

        Route::resource('newprojectopp', 'NewProjectOppController');

        Route::resource('marketinfo', 'MarketIntelligenceController');

        Route::resource('order', 'OrderController');

        Route::resource('order_product', 'ProductsOrderController');

        Route::resource('attendance', 'AttendanceController');

        Route::resource('travelexpense', 'TravelExpController');

        Route::resource('customer_stat', 'CustomerStatisticController');

        Route::resource('customer-reviews', 'ReviewController');

        Route::resource('product_stat', 'ProductStatisticController');

        Route::get('location', 'LocationController@GetAllLocation');

        Route::post('locationapi', 'LocationApi@store');

        Route::post('bulk', 'LocationApi@locationbulk');

        Route::get('locationapi/{id}', 'LocationApi@get');

        Route::get('location_emp_api/{id}', 'LocationApi@emp');

        Route::get('getMyLocations', 'LocationApi@current_emp_filter');

        Route::post('location_emp_api/{id}', 'LocationApi@emp_filter');

        Route::get('location_online_emp', 'LocationApi@emp_getonline');

        Route::resource('new_task', 'ApiEmpScheduleController');
        Route::post('updateTaskStatus/{id}', 'ApiEmpScheduleController@updateTaskStatus');
        Route::post('allocateTask/{task_id}', 'ApiEmpScheduleController@allocateTask');
        Route::get('getTaskSummary/{task_id}', 'ApiEmpScheduleController@getTaskSummary');

        // //beta
        // Route::resource('new_task', 'NewEmpScheduleController');
        // Route::post('new_emp_task/{id}', 'NewEmpScheduleController@updatetask');
        // //beta end


         Route::post('emp_task/{id}', 'ApiEmpScheduleController@updatetask');

        Route::resource('request', 'RequestsController');

        Route::get('profile', 'UserProfileController@index');

        Route::put('updateprofile', 'UserProfileController@update');
        Route::post('updateActivity', 'UserProfileController@updateActivity');

        Route::put('change_password_emp', 'UserProfileController@reset_password');

        Route::get('role', 'Base@role');

        //Route::resource('dbaudits', 'DBLogAuditsController');

        // Approval Status

        Route::get('requestapi', 'RequestApproval@get');

        Route::get('managers', 'UserController@managers');

        Route::post('requestapi', 'RequestApproval@post');

        Route::get('master_getDb', 'CompanyController@getDbinfo');

        // Types

        Route::resource('category', 'CategoryController');

        Route::resource('search', 'AutoCompleteController');

        Route::resource('activity', 'ActivityController');

        Route::resource('prospect', 'ProspectController');

        Route::get('user_roles', 'UserController@roles');

        Route::resource('user', 'UserController');

        Route::post('adminresetpassword', 'UserController@resetpassword');

        Route::resource('caseinfo', 'CaseInfoController');

        Route::get('get_case_details', 'CaseInfoController@getCaseDetails');

        // Uploaded Document's

        Route::post('upload', 'FileController@put');

        //Delete Documents by Resourece


        Route::get('file', 'VisitReportController@delete_file');




    });

});
