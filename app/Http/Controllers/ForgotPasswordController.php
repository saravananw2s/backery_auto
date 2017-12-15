<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Base;
use Firebase\JWT\JWT;
use Illuminate\Http\Request;
use Vinkla\Hashids\Facades\Hashids;
class ForgotPasswordController extends Controller
{

    public function sendmail(Request $request)
    {

        $rules = [
            'email' => 'required|email',
            'email' => 'exists:user,email',
        ];

        $data = $request->input('data');

        $validator = \Validator::make($data, $rules);

        if ($validator->fails()) {
            return Base::touser($validator->errors()->all()[0]);
        }

        $user = \App\Models\User::where('email', $data['email'])->first();

        if (!$user->is_active) {
            return Base::touser("Your Account is not active");
        }

       $new =  str_random(10); 
       $user->user_pwd = encrypt($new);
       $user->save();


        \App\Http\Controllers\NotificationsController::resetPassword($user);

        return Base::touser("New password has been sent to your e-mail address ", true);
    }

    public function resetpassword(Request $request)
    {


      // $salt = Base::salt;

      //   $data = $user->user_id;

      //   $date = new \DateTime();
      //   $date->modify("+1 hour");

      //   $token = array(
      //       "resettoken" => Hashids::encode($data) . '_' . \Hash::make(str_random(500)),
      //       "iss"        => Base::get_domin(),
      //       "expire"     => $date,
      //   );

      //   $jwt = JWT::encode($token, $salt);



    	// $rules = [
     //        'token' => 'required|min:10',
     //    ];

     //    $data = $request->input('data');

     //    $validator = \Validator::make($data, $rules);

     //    if ($validator->fails()) {
     //        return Base::touser($validator->errors()->all()[0]);
     //    }

      
     //    $decoded = JWT::decode($jwt, $salt, array('HS256'));

     //    $decoded = (array) $decoded;

     //    $expire = new \DateTime($decoded['expire']->date);

     //    $current = new \DateTime();

     //    if ($expire < $current) {
     //        return Base::touser("Token Expired", true);
     //    }

     //    $decoded['resettoken'] = strstr($decoded['resettoken'], '_', true);

     //    $token_user_id = Hashids::decode($decoded['resettoken'])[0];

     //     $user = \App\Models\User::find($token_user_id);


     //    print_r($user);
    }

}
