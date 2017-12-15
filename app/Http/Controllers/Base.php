<?php
namespace App\Http\Controllers;
use App\Models\ApiAuth;
use App\Models\CompanyDbInfo as db_info;
use App\Models\SuperAdmin as master;
use App\Models\UserRole;
use App\Models\User;
use App\Models\Master as CompanyInfo;
use App\Models\EmpCustSchedule as emp_cust;
use Config;
use DB;
use Illuminate\Support\Facades\Hash;
use Firebase\JWT\JWT;
use Illuminate\Http\Request;
use Illuminate\Http\Response;
use Illuminate\Support\Facades\Validator;
use Vinkla\Hashids\Facades\Hashids;
use \DateTime;
use \DateTimeZone;
use App\Models\SessionClient as clientinfo;
use Carbon\Carbon;
use App\Models\TravelHistory;
use App\Http\Controllers\Textlocal;
use PushNotification;
class Base extends Controller
{
    const salt = "4Ud0ZxvydK0pc+oBSsJ11ResjdcGJTVBGPHgtO1+SBc=";

    const tasktypes = ['Normal Visit', 'Request', 'Take Order', 'Complaint'];

    const modelmap = array(
        'Normal Visit' => 'OrderBooking',
        'Request' => 'OrderBooking',
        'Take Order' => 'OrderBooking',
        'Complaint' => 'OrderBooking',
        'Complaint' => 'OrderBooking',
        );





    const active = ['De Active', 'Active'];
    const visit_types = ['Waiting for Approvel', 'Approved', 'Un Approved'];

    const urls =  array(
            "login" => "/dashboard/#/signin"
            );

    public function broadcastAuth(Request $request)
    {
       echo 'auth';
        // print_r($request->all());
        // abort(403);
    }
    public static function convert_to_url($name)
    {
        return  preg_replace('/\s+/', '', $name);
        //return str_slug($name, '-');
    }


 public function testkali()
    {

    $data = PushNotification::setService('apn')
            ->setMessage([
                'aps' => [
                    'alert' => [
                        'title' => 'jskajsakskaks',
                        'body'  => 'saldkskdfjkd',
                        // "click_action" => "FCM_PLUGIN_ACTIVITY",  //Must be present for Android
                        // "icon" => "sfaicon"  //White icon Android resource
                    ],
                    'sound' => 'default',
                ],

                // ,'extraPayLoad' => [
                //     'custom' => 'My custom data',
                // ]
            ])
            ->setDevicesToken(['95050d8a744bf257126381b9201e099bf0b22602070b7f89955ea7737dafa925'])
            ->send()
            ->getFeedback()
        ;

        print_r($data);
        return 'hi';

    }
    public static function getEmpBelongsUser($emp_id)
    {

        $users = [];


        $data  = User::where('belongs_manager', $emp_id)

            ->orwhere('user_id' ,$emp_id )


            ->get(['user_id'])->toArray();


        foreach ($data as $key => $value) {

             $users[] =   $data[$key]['user_id'];
        }


        return $users;
    }



  public static function setHeaderContentType($file)
{
    //Number to Content Type
    $ntct = Array( "1" => "image/gif",
                   "2" => "image/jpeg", #Thanks to "Swiss Mister" for noting that 'jpg' mime-type is jpeg.
                   "3" => "image/png",
                   "6" => "image/bmp",
                   "17" => "image/ico");

    header('Content-type: ' . $ntct[exif_imagetype($file)]);
}

 public static function TestSendSms()
{
 // dd(self::SendSms([919524609638],'Info for testing'));
}
 public static function SendSms($phone,$body)
{

    if(!is_array($phone))
    {
        $phone = array($phone);
    }


    if(count($phone) < 1)
    {
        return false;
    }

    if(empty($body))
    {
        return false;
    }


try
{

    // Authorisation details.
    $username = "pratap.murugan@way2smile.com";
    $hash = "8fdcff84d495f05367649d3334b5adfb5d57ef101c2c48068fb59cc074ec5118";
    // Config variables. Consult http://api.textlocal.in/docs for more info.
    $test = "0";
    // Data for text message. This is the text message data.
    $sender = "TXTLCL"; // This is who the message appears to be from.
    $numbers = implode(',', $phone); // A single number or a comma-seperated list of numbers
    $message = $body;
    // 612 chars or less
    // A single number or a comma-seperated list of numbers
    $message = urlencode($message);
    $data = "username=".$username."&hash=".$hash."&message=".$message."&sender=".$sender."&numbers=".$numbers."&test=".$test;
    $ch = curl_init('http://api.textlocal.in/send/?');
    curl_setopt($ch, CURLOPT_POST, true);
    curl_setopt($ch, CURLOPT_POSTFIELDS, $data);
    curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
    $result = json_decode(curl_exec($ch));
    curl_close($ch);

    //print_r($result);
    if($result->status === 'success')
    {
         return true;
    }
    else
    {
        return false;
    }


}
catch(\Exception $e)
{
    return false;
}


}




  public static function GoogleShortner($longUrl)
{

try
{
$ch = curl_init( 'https://www.googleapis.com/urlshortener/v1/url?key=AIzaSyCg3dCG78pwNxafQnLUkt9cCYN22ETf5is' );
# Setup request to send json via POST.
$payload = json_encode( array( "longUrl"=> $longUrl ) );
curl_setopt( $ch, CURLOPT_POSTFIELDS, $payload );
curl_setopt( $ch, CURLOPT_HTTPHEADER, array('Content-Type:application/json'));
# Return response instead of printing.
curl_setopt( $ch, CURLOPT_RETURNTRANSFER, true );
# Send request.
$result = json_decode(curl_exec($ch));
curl_close($ch);
if($result->id)
{
 return $result->id;
}
else
{
return $longUrl;
}

}
catch(\Exception $e)
{
return $longUrl;
}

}


        public static function change_db($domain)
        {
            if ($domain == self::app_domain()) {

            return;
        }
            self::set_database_config($domain);
        }


    public static function getLogo()
    {



    DB::setDefaultConnection('mysql');

    $name = Config::get('app.logo');

    $data = db_info::with('company')->where('sub_domain_url', self::get_domin())->get()->toArray();

    if(count($data) == 1)
    {

        if($data[0]['company']['logo'])
        {

        $info = json_decode($data[0]['company']['logo']);


        if(is_array($info))
        {
            $name = $info[0];
        }
    }
    }



function get_http_response_code($url) {
    $headers = get_headers($url);
    return substr($headers[0], 9, 3);
}
if(get_http_response_code($name) != "200"){

    $name = 'http://manageteamz.com/assets/images/logo/Logo2.png';

}



        $file = file_get_contents($name);
    self::setHeaderContentType($name);
    echo  $file;



    }





    public static function getTaskByModel()
    {

        //self::createDb('kali');
        print_r(self::modelmap[self::tasktypes[1]]);
    }

    public static function throwerror()
    {
        return self::touser('Data or System Error');
    }

    public static function create_jserror(Request $request)
    {
        if ($request->input('value')['info'] !== null) {
            DB::table('js_error')->insert(
            ['error' => $request->input('value')['info'],
            'created_at' =>  \Carbon\Carbon::now(),
            'user_agent' =>  self::user_agent()
            ]
        );
        }
    }

    public static function get_jserror(Request $request)
    {
        $data = DB::table('js_error')->distinct('error')->get();

        echo 'Total Erros : '. count($data).'';

        foreach ($data as $key => $value) {
            echo '<br/><br/>Date : ' .$value->created_at;

            echo '<br/><br/>Browser Agent : ' .$value->user_agent;


            echo '<br/><pre>';


            echo 'Error Stack : ' .$value->error;
            echo '</pre>';
        }
    }

public static function db_connection()
{
    if(DB::connection()->getDatabaseName())
   {
     return DB::connection()->getDatabaseName();
   }
   else
   {
        return 'root_db';
   }
}


    public static function UpdateTask($type, $date, $cust_id, $emp_id, $complete = true)
    {
        if ($complete) {
            $info = array('status' => 'complete');
        } else {
            $info = array('status' => 'waiting');
        }

        emp_cust::where('date', '=', $date)
        ->where('emp_id', '=', $emp_id)
        ->where('type', '=', $type)
        ->where('cust_id', '=', $cust_id)
        ->update($info);

        return;
    }

    public static function super_admin()
    {
        return 'super_admin';
    }

    public static function guest()
    {
        return 'guest';
    }


    public static function backendadmin()
    {
        return 'admin';
    }

    public static function manager($check = 0)
    {
        if (self::mobile_header() == 1 && $check == 0) {
            return "emp";
        }

        return 'manager';
    }



    public static function tomysqldate($date)
    {

                $timestamp = strtotime($date);
                $date = date('Y-m-d', $timestamp);
                return $date;
    }

    public static  function ConvertTimezone($value,$get = false)
    {
        if($get)
        {
            if($value == null)
            {
               return $value;
            }
            else
            {
                $value = Carbon::createFromTimestamp(strtotime($value))->timezone(self::client_timezone());
             return $value->toDateTimeString();
            }
        }
        if ($value instanceof Carbon) {

            return $value;

        }

     return Carbon::createFromTimestamp(strtotime($value))->timezone(self::client_timezone());
    }


    public static function timezone_check($timezone)
    {
         return in_array($timezone, timezone_identifiers_list());
    }
    public static function toHumanRead($minutes)
    {
        $d = floor ($minutes / 1440);
        $h = floor (($minutes - $d * 1440) / 60);
        $m = $minutes - ($d * 1440) - ($h * 60);
        return  "{$d} days {$h} hours  {$m} mins";
    }

    public static function tomysqldatetime($date)
    {

        if (self::mobile_header() == 1)
            {
                $dt = new DateTime($date,new DateTimeZone(self::client_timezone()));
                $tz = new DateTimeZone(\Config::get('app.timezone'));
                $dt->setTimezone($tz);
                return  $dt->format('Y-m-d H:i');

            }
        else
            {
                $dt = new DateTime($date,new DateTimeZone(self::client_timezone()));
                $tz = new DateTimeZone(\Config::get('app.timezone'));
                $dt->setTimezone($tz);
                return $dt->format('Y-m-d H:i');

            }

    }


    public static function  current_client_datetime()
{

    if (array_key_exists('HTTP_X_CLIENT_DATE', $_SERVER)) {
        if (null == $_SERVER['HTTP_X_CLIENT_DATE'] && empty($_SERVER['HTTP_X_CLIENT_DATE'])) {
            return date('Y-m-d H:i:s');
        }
    } else {
        return date('Y-m-d H:i:s');
    }

    if ($_SERVER['HTTP_X_CLIENT_DATE'] == null) {
        return date('Y-m-d H:i:s');
    }
    try
    {
        $date = $_SERVER['HTTP_X_CLIENT_DATE'];
        $dt   = new DateTime($date);
        return $dt->format('Y-m-d H:i:s');
    } catch (\Exception $e) {
        return date('Y-m-d H:i:s');
    }

}

    public static function client_timezone()
        {
            if (array_key_exists('HTTP_X_CLIENT_DATE', $_SERVER)) {
                if (null == $_SERVER['HTTP_X_CLIENT_DATE'] && empty($_SERVER['HTTP_X_CLIENT_DATE'])) {
                  return 'UTC';
                }
            } else {
              return 'UTC';
            }

             if($_SERVER['HTTP_X_CLIENT_DATE'] == null)
        {
           return 'UTC';
        }
        try
        {
        $date = $_SERVER['HTTP_X_CLIENT_DATE'];
        $dt = new DateTime($date);
        return $dt->format('T P');
        }
        catch(\Exception $e)
        {
          return 'UTC';
        }

        }

    public static function utcToUserTimeZone($datetime)
    {
        $dt = new \DateTime($_SERVER['HTTP_X_CLIENT_DATE'],new \DateTimeZone(self::client_timezone()));
        $tz = new \DateTimeZone(\Config::get('app.timezone'));
        $dt->setTimezone($tz);
        return $dt->format('Y-m-d H:i');
    }

    public static function create_sub_db($company_name, $comp_id)
    {
        $web = self::getNewSubDomain($company_name) . '.' . str_replace('www.','',self::app_domain());
        $sub_db = new db_info();
        $sub_db->sub_domain_url = $web;
        $sub_db->sub_db_host = Config::get('database.connections.mysql.host');
        $sub_db->sub_db_port = Config::get('database.connections.mysql.port');
        $sub_db->sub_db_user = Config::get('database.connections.mysql.username');
        $sub_db->sub_db_name = self::createDb($company_name);
        $sub_db->sub_db_pwd = encrypt(Config::get('database.connections.mysql.password'));
        $sub_db->company_id = $comp_id;
        $sub_db->save();
        $company = new CompanyInfo();
        $company_data = $company->with('db_info')->find($comp_id)->toArray();
        self::createSubDb($sub_db->sub_db_name,$company_data);
        return;
    }

    public static function createDb($dbname)
    {
        $dbname = htmlentities($dbname, ENT_QUOTES, 'UTF-8', false);
        $dbname = strtolower((preg_replace("/[^a-zA-Z0-9]+/", "", $dbname) . '_' . str_random(5)));

        return $dbname;
    }

    public static function createSubDb($dbname,$company_data)
    {



        $dbsql = str_replace('core_db', $dbname, file_get_contents(env('SUB_DB_FILE')));

        DB::unprepared($dbsql);

        self::set_database_config(self::app_domain());

        //self::set_database_config($company_data['db_info']['sub_domain_url']);


        // self::set_database_config(self::app_domain());
        $user             = new User();
        $user->role_id    = 3;
        $user->first_name = 'Admin';
        $user->last_name  = $company_data['company_name'];
        $user->user_pwd   = encrypt('root');
        $user->is_active = 1;
        $user->phone      = $company_data['company_phone'];
        $user->email      = $company_data['company_email'];
        $user->save();

        return $dbname;
    }

    public static function up_db(Request $request)
    {
        $dbsql =file_get_contents(env('DB_FILE'));


        DB::unprepared($dbsql);

        self::set_database_config();

        return 'ok';
    }




    public static function getNewSubDomain($name)
    {
        $name = self::convert_to_url($name);

        $db = db_info::where('sub_domain_url', '=', $name)->first();
        if ($db === null) {
            return $name;
        } else {
            return $name . '1';
        }
    }


    public static function code(Request $request)
    {
        $users = DB::table('master')->paginate(1);

        return self::touser($users, true);
    }

    public static function set_database_config($url = 1)
    {
        DB::setDefaultConnection('mysql');

        if ($url == self::app_domain()) {
            return;
        }

        $data = db_info::where('sub_domain_url', $url)->first();

        if (count($data) == 1) {
            Config::set('database.connections.subdb', array(
                'driver' => 'mysql',
                'host' => $data->sub_db_host,
                'port' => $data->sub_db_port,
                'database' => $data->sub_db_name,
                'username' => $data->sub_db_user,
                'password' => decrypt($data->sub_db_pwd),
                'charset' => 'utf8',
                'collation' => 'utf8_unicode_ci',
                'prefix' => '',
                ));


            DB::setDefaultConnection('subdb');
        } else {
            DB::setDefaultConnection('mysql');
        }
    }


    public static function super_admin_db()
    {
        // if (self::role() == self::super_admin()) {
            self::sub_root_domain();
        // }
    }


    public static function db_connection_reset()
    {
        self::set_database_config();
    }


    public static function time_elapsed_string($datetime, $full = false,$start = false)
    {
        if($start == false)
        {
            $now = new DateTime;
        }
        else
        {
            $now = new DateTime($start);
        }

        $ago = new DateTime($datetime);
        $diff = $now->diff($ago);

        $diff->w = floor($diff->d / 7);
        $diff->d -= $diff->w * 7;


        $string = array(
            'y' => 'year',
            'm' => 'month',
            'w' => 'week',
            'd' => 'day',
            'h' => 'hour',
            'i' => 'min',
             // 's' => 'sec',
            );
        foreach ($string as $k => &$v) {
            if ($diff->$k) {
                $v = $diff->$k . ' ' . $v . ($diff->$k > 1 ? 's' : '');
            } else {
                unset($string[$k]);
            }
        }

        if (!$full) {
            $string = array_slice($string, 0, 1);
        }

        if($start == false)
        {
        return $string ? implode(', ', $string) . ' ago' : 'just now';
        }
        else
        {
         return $string ? implode(', ', $string) . '' : '';
        }
    }


    public static function is_app_domain()
    {
        $val = false;

     if (self::get_domin() == self::app_domain()) {
            $val = true;
        }

      if(self::get_sub_domain() === 'www')
      {
           $val = true;
      }



        return $val;
    }



     public static function get_sub_domain()
    {

      $domains = explode('.',parse_url(\URL::current())['host']);

      if($domains[0] == 'manageteamz' )
      {
        return 'www';
      }
      elseif ($domains[0] == 'www' ) {
           return 'www';
      }
      else {

       return $domains[0];
      }

        // $url = parse_url(Config::get('app.url'))['host'];

        // return $url;
    }




    public static function app_domain()
    {
        $url = parse_url(Config::get('app.url'))['host'];

        return $url;
    }

    public static function app_unauthorized()
    {
        abort(401, 'Un Authorized Access');

        die();
    }

    public static function get_domin()
    {
        $url = parse_url(\URL::current())['host'];

        return $url;
    }


    public static function mobile_header()
    {
        if (array_key_exists('HTTP_MOBILE', $_SERVER)) {
            if (null == $_SERVER['HTTP_MOBILE'] && empty($_SERVER['HTTP_MOBILE'])) {
                return 0;
            }
        } else {
            return 0;
        }

        return 1;
    }


        public static function timezone()
    {
        if (array_key_exists('HTTP_TIMEZONE', $_SERVER)) {

            if (null == $_SERVER['HTTP_TIMEZONE'] && empty($_SERVER['HTTP_TIMEZONE'])) {
                return 0;
            }

        } else {

            return 0;
        }

        return 1;
    }






    public static function client_data()
    {
        if (array_key_exists('HTTP_X_CLIENT_DATA', $_SERVER)) {
            if (null == $_SERVER['HTTP_X_CLIENT_DATA'] && empty($_SERVER['HTTP_X_CLIENT_DATA'])) {
                self::app_unauthorized();
            }
        } else {
            self::app_unauthorized();
        }

        return $_SERVER['HTTP_X_CLIENT_DATA'];
    }


    public static function check_client_data()
    {
        $auth_user = clientinfo::where('client_data', '=', self::client_data())->first();


        if (count($auth_user) == 1) {
            return true;
        }

        return false;
    }


    public static function emp_id($api = false)
    {
        if (self::is_token()) {
            if (self::get_token() == false) {
                self::app_unauthorized();
            }

            self::set_database_config();

            $auth = self::auth_token(self::get_token());

            if ($auth[0] == 'true') {
                $model = $auth[1]->toArray();


                if ($model['auth_model'] == self::master_model()) {
                    self::sub_root_domain();
                    if ($api) {
                        return self::touser(self::super_admin(), true);
                    } else {
                        return self::super_admin();
                    }
                } else {
                    $model = $model['auth_model']::findorfail(self::decode_token(self::get_token()));


                    if ($api) {
                        return self::touser($model->user_id, true);
                    } else {
                        return $model->user_id;
                    }
                }
            } else {
                self::app_unauthorized();
            }
        } else {
            self::app_unauthorized();
        }
    }

    public static function auth_token($token)
    {
        if ($token == false) {
            self::app_unauthorized();
        }



        $auth_user = ApiAuth::where('auth_key', '=', $token)->first();

        if (count($auth_user) == 1 && self::check_client_data()) {
            if ($auth_user->is_active) {
                return ['true', $auth_user];
            } else {
                return ['false'];
            }
        } else {
            return ['false'];
        }
    }


    public static function decode_token($data)
    {
        $salt = self::salt;

        $decoded = JWT::decode($data, $salt, array('HS256'));

        $decoded = (array)$decoded;


        $decoded['apitoken'] = strstr($decoded['apitoken'], '_', true);


        $token_user_id = Hashids::decode($decoded['apitoken'])[0];

        return $token_user_id;
    }

    public static function role()
    {
        if (self::is_token()) {
            if (self::get_token() == false) {
                return self::guest();
            }



            $auth = self::auth_token(self::get_token());


            if ($auth[0] == 'true') {
                $model = $auth[1]->toArray();




                if ($model['auth_model'] == self::master_model()) {
                    self::sub_root_domain();
                    return self::super_admin();
                } else {



                    $model = $model['auth_model']::findorfail(self::decode_token(self::get_token()));



                    if(!$model->is_active)
                    {
                            return self::guest();
                    }


                    return $model->role->name;
                }
            } else {
                return self::guest();
            }
        } else {
            return self::guest();
        }
    }


    public static function getRole()
    {
        if (self::get_token() == false) {
            return self::guest();
        }

        $auth = self::get_token();



        $auth_user = ApiAuth::where('auth_key', '=', self::get_token())->first();



        if (count($auth_user) == 1) {
            $model = $auth_user->toArray();


            if ($model['auth_model'] == self::master_model()) {
                return [self::super_admin(), null];
            } else {
                $model = $model['auth_model']::findorfail(self::decode_token(self::get_token()));

                return [$model->role->name, $model->user_id];
            }
        } else {
            return self::guest();
        }
    }


    public static function sub_root_domain()
    {
        if (array_key_exists('HTTP_X_SUB_ROOT_DOMAIN', $_SERVER)) {
            if (null == $_SERVER['HTTP_X_SUB_ROOT_DOMAIN'] && empty($_SERVER['HTTP_X_SUB_ROOT_DOMAIN'])) {
            } else {
                if (self::app_domain() == $_SERVER['HTTP_X_SUB_ROOT_DOMAIN']) {
                } else {
                    self::set_database_config($_SERVER['HTTP_X_SUB_ROOT_DOMAIN']);
                }
            }
        }



        return true;
    }


    public static function to_month($input)
    {


        $monthNum  = $input;
$dateObj   = DateTime::createFromFormat('!m', $monthNum);


return $dateObj->format('F'); // March


    }

    public static function get_token()
    {
        $val = false;

        if (array_key_exists('HTTP_AUTHORIZATION', $_SERVER)) {
            if (null == $_SERVER['HTTP_AUTHORIZATION'] && empty($_SERVER['HTTP_AUTHORIZATION'])) {
                return $val;
            } else {
                return $_SERVER['HTTP_AUTHORIZATION'];
            }
        } elseif (isset($_REQUEST['token']) && !empty($_REQUEST['token'])) {
            return $_REQUEST['token'];
        } else {
            return $val;
        }
    }

    public static function is_token()
    {
        if (array_key_exists('HTTP_AUTHORIZATION', $_SERVER)) {
            if (null == $_SERVER['HTTP_AUTHORIZATION'] && empty($_SERVER['HTTP_AUTHORIZATION'])) {
                return false;
            } else {
                return true;
            }
        } elseif (isset($_REQUEST['token']) && !empty($_REQUEST['token'])) {
            return true;
        } else {
            return false;
        }
    }

    public static function isAdmin($role)
    {
        if (self::super_admin() == $role) {
            return true;
        } else {
            return false;
        }
    }

    public static function isManager($role)
    {
        if (self::manager() == $role) {
            return true;
        } else {
            return false;
        }
    }

    public static function isBackendAdmin($role)
    {
        if (self::backendadmin() == $role) {
            return true;
        } else {
            return false;
        }
    }












    public static function master_model()
    {
        return master::class;
    }


    public static function decode_token_model($data)
    {
        $salt = self::salt;
        $decoded = JWT::decode($data, $salt, array('HS256'));

        $decoded = (array)$decoded;


        $token_user_id = Hashids::decode($decoded['apitoken'])[0];

        return $token_user_id;
    }

    public function appcall($val)
    {
        $this->appcall = $val;
    }

      public  function logout(Request $request)
    {
        $data = $request->input('data');

        clientinfo::where('client_data',$data['client_data'])->delete();

        return   self::touser($request->input('data'), true);
    }



    public function web_auth(Request $request)
    {
        $data = $request->input('data');

        $rules = [
        'email' => 'required|email',
        'password' => 'required|min:3',

        ];

        $validator = Validator::make($data, $rules);

        if ($validator->fails()) {
            return self::touser($validator->errors()->all()[0]);
        }


        if (null !== $request->input('api')) {
            $valid = User::where('email', '=', $data['email'])
               ->whereIn('role_id', [2,3])
        ->first();
        } else {
            $valid = User::where('email', '=', $data['email'])

         ->whereIn('role_id', [1,2])
        ->first();
        }

        $exits = (int)count($valid);

        if ($exits == 1) {
            if ((decrypt($valid->user_pwd) === $data['password'])) {
                if ($valid->is_active == 1) {


                    $data['device_token'] = isset($data['device_token']) ? $data['device_token'] : '';

                    if(self::mobile_header() == 1)
                    {
                        $data['device_type'] = $_SERVER['HTTP_MOBILE'];
                    }
                    $data['device_type'] = isset($data['device_type']) ? $data['device_type'] : '';



                    $key = self::token($valid->user_id, User::class, $data['device_token'],$data['device_type']);



                    if (null !== $request->input('api')) {

                        return self::touser(['token' => $key, 'role' => $valid->role->name,'gps_active' => (int) $valid->zipcode,'demo_links' => $valid->demo_links], true);



                    } else {
                      return self::touser(['token' => $key, 'role' => $valid->role->name,'gps_active' => (int) $valid->zipcode,'activity' => $valid->activity], true);

                    }
                } else {
                    return self::touser('Account not activated');
                }
            } else {
                return self::touser('Password not match');
            }
        } elseif (self::is_app_domain()) {
            if (count(master::where('email', $data['email'])->first()) == 1) {
                $valid = master::where('email', $data['email'])->first();


                if ((decrypt($valid->pwd) === $data['password'])) {
                    if ($valid->is_active == 1) {
                        $key = self::token($valid->id, master::class); //logged



                            return self::touser(['token' => $key, 'role' => self::super_admin()], true);
                    } else {
                        return self::touser('Account not activated');
                    }
                } else {
                    return self::touser('Password not match');
                }
            } else {
                return self::touser('No Account Found');
            }
        } else {
            return self::touser('No Account Found');
        }
    }



    public static function check_null($data)
    {
        $data = isset($data) ? $data : null;
        return $data;
    }

    public static function file_check($data)
    {
        if(is_array($data))
        {
            return json_encode($data);
        }
        else
        {
            return '[]';
        }

    }







    public static function touser($data, $status = false,$code = 200)
    {
        $st = 'error';

        if ($status) {
            $st = 'ok';
        }

        /* $else = json_encode(array('data' => $data, 'status' => $st));



         $data = $else;
         */

         $data = json_encode(array('data' => $data, 'status' => $st));

        return response($data, $code)->withHeaders(['Content-Type' => 'application/json']);
    }


    public static function token($data, $model,$device_token = null,$device_type = null)
    {
        $salt = self::salt;
        $user_ip = self::ip();
        $user_agent = self::user_agent();

        $token = array(
            "apitoken" => Hashids::encode($data).'_'.\Hash::make(str_random(500)),
            "iss" => self::get_domin(),
            "type" =>  str_replace('App\\Models\\','',$model),
            );



        $jwt = JWT::encode($token, $salt);


        $exist = count(ApiAuth::where('auth_key', '=', $jwt)->get()->toArray());
        $session = clientinfo::firstOrNew(array('client_data' => self::client_data()));
        $session->client_ip = $user_ip;
        $session->client_data = self::client_data();
        $session->client_info = $user_agent;
        $session->save();



//     $array =
//     [
//     "auth_key" => $jwt,
//     "auth_user_agent" => $user_agent,
//     "auth_ip" => $user_ip,
//     "auth_model" => $model,
//     "auth_user_id" => $data,
//     ];



//         $api = ApiAuth::updateOrCreate($array);

// return $jwt;
        if ($exist > 0) {
            $api = ApiAuth::where('auth_key', '=', $jwt)->first();
            $api->auth_key = $jwt;
            $api->auth_user_agent = $user_agent;
            $api->auth_ip = $user_ip;
            $api->auth_model = $model;
            $api->auth_user_id = $data;
            $api->device_token = $device_token;
            $api->device_type = $device_type;

            $api->save();
        } else {
            $api = new ApiAuth;
            $api->auth_key = $jwt;
            $api->auth_user_agent = $user_agent;
            $api->auth_ip = $user_ip;
            $api->auth_model = $model;
            $api->auth_user_id = $data;
            $api->device_token = $device_token;
            $api->device_type = $device_type;
            $api->save();
        }



        return $jwt;
    }

    public static function ip()
    {
        $ip = '';

        if (!empty($_SERVER['HTTP_CLIENT_IP'])) {
            $ip = $_SERVER['HTTP_CLIENT_IP'];
        } elseif (!empty($_SERVER['HTTP_X_FORWARDED_FOR'])) {
            $ip = $_SERVER['HTTP_X_FORWARDED_FOR'];
        } else {
            $ip = $_SERVER['REMOTE_ADDR'];
        }

        return $ip;
    }

    public static function user_agent()
    {
        return $_SERVER['HTTP_USER_AGENT'];
    }




}



/*if($request->ajax()){

   return response()->json(['data' => ['ajax'],'status' => 'ok']);
}

return response()->json(['data' => ['http'],'status' => 'ok']);

need when go live with domain

if(parse_url($request->url())['host'] !== parse_url(\Config::get('app.url'))['host'] )
{
Base::set_database_config($request->url());
}

URL::full();
URL::current();
URL::previous();


URL::to('foo/bar', $parameters, $secure);
URL::action('FooController@method', $parameters, $absolute);
URL::route('foo', $parameters, $absolute);
URL::secure('foo/bar', $parameters);
URL::asset('css/foo.css', $secure);

URL::secureAsset('css/foo.css');
URL::isValidUrl('http://example.com');
URL::getRequest();
URL::setRequest($request);
URL::getGenerator();
URL::setGenerator($generator);


 public function __construct()
    {

        $this->role_info = Base::getRole();
        $this->admin = false;
        $this->role = Base::guest();
        $this->emp_id = null;

        if(is_array($this->role_info))
        {
        $this->emp_id = $this->role_info[1];
        $this->role = $this->role_info[0];

        if($this->role  == Base::super_admin())
        {
        $this->admin = true;
        }

       }
      else
       {
        self::app_unauthorized();
       }
    }

    if(self::get_token() !== false)
{
$auth_user = ApiAuth::where('auth_key','=', self::get_token())->toSql();
}

      if(\DB::connection()->getDatabaseName())
   {
     echo "connected successfully to database ".\DB::connection()->getDatabaseName();
   }*/
