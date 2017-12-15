<?php
namespace App\Http\Controllers;

use App\Http\Controllers\Base;
use App\Models\CompanyDbInfo;
use App\Models\Master;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Validator;

class CreateAccountsController extends Controller
{

     public static function createEmp(Request $request)
     {   $rules = [

            'first_name' => 'required',
            'last_name'  => 'required',
            'phone'      => 'required',
            // 'street'        => 'required',
            // 'city'          => 'required',
            // 'state'         => 'required',
            // 'zipcode'       => 'required',
            // 'country'       => 'required',
            // 'profile_image' => 'required',
            'email'      => 'required|email|unique:user',
        ];

        $data = $request->input('data');

        $validator = Validator::make($data, $rules);

        if ($validator->fails()) {
            return Base::touser($validator->errors()->all()[0]);
        }
         $data['role_id'] = 2;
        $user             = new User();
        $user->role_id    = $data['role_id'];
        $user->first_name = $data['first_name'];
        $user->last_name  = $data['last_name'];
        $user->user_pwd   = encrypt(strtolower(str_random(5)));
        $user->phone      = $data['phone'];
        $user->email      = $data['email'];

        $user->city    = isset($data['city']) ? $data['city'] : null;
        $user->street  = isset($data['street']) ? $data['street'] : null;
        $user->state   = isset($data['state']) ? $data['state'] : null;
        $user->zipcode = isset($data['zipcode']) ? $data['zipcode'] : null;
        $user->country = isset($data['country']) ? $data['country'] : null;

        $user->profile_image = isset($data['profile_image']) ? json_encode($data['profile_image'], true) : '[]';

        $user->phone_imei = isset($data['phone_imei']) ? $data['phone_imei'] : '';
        $user->is_active  = isset($data['is_active']) ? $data['is_active'] : 1;
        $user->save();

        $user->belongs_manager = $user->user_id;

        $user->save();

        \App\Http\Controllers\NotificationsController::WelcomeEmp($user);

        return Base::touser('Thanks for Sign UP', true);

    }


      public static function createCompany(Request $request)
     {           $data = $request->input('data');

            $rules = [
                'company_name'  => 'required|unique:master',
                // 'company_street'  => 'required',
                // 'company_city'    => 'required',
                // 'company_state'   => 'required',
                // 'company_zipcode' => 'required',
                // 'company_url'     => 'required',
                'company_phone' => 'required',
                // 'company_country' => 'required',
                'company_email' => 'required|email|unique:master,company_email',
            ];

            $validator = Validator::make($data, $rules);

            if ($validator->fails()) {
                return Base::touser($validator->errors()->all()[0]);
            }

            $company = new Master;

            $company->company_name    = $data['company_name'];
            $company->company_zipcode = isset($data['company_zipcode']) ? $data['company_zipcode'] : '';
            $company->company_state   = isset($data['company_state']) ? $data['company_state'] : '';
            $company->company_city    = isset($data['company_city']) ? $data['company_city'] : '';
            $company->company_street  = isset($data['company_street']) ? $data['company_street'] : '';
            $company->company_phone   = $data['company_phone'];
            $company->company_url     = isset($data['company_url']) ? $data['company_url'] : '';
            $company->company_desc    = isset($data['company_desc']) ? $data['company_desc'] : '';
            $company->company_country = isset($data['company_country']) ? $data['company_country'] : '';
            $company->company_pwd     = encrypt(Hash::make(str_random(12)));
            $company->company_email   = $data['company_email'];
            $company->logo   = isset($data['logo']) ? json_encode($data['logo']) : '';
            $company->save();

            Base::create_sub_db($company->company_name, $company->company_id);

            return Base::touser('Company Created', true);
    }

}
