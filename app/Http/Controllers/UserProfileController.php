<?php
namespace App\Http\Controllers;

use Illuminate\Auth\Access\Response;
use Illuminate\Http\Request;
use App\Models\User;
use App\Http\Controllers\Base;
use Validator;

class UserProfileController extends Controller
{
    public function index()
    {
        return Base::touser(User::where('user_id', '=', $this->emp_id)->first(), true);
    }

    public function update(Request $request)
    {
        $data = $request->input('data');

        $rules = [
'first_name' => 'required',
'last_name' => 'required',
'street' => 'required',
// 'city' => 'required',
// 'state' => 'required',
// 'zipcode' => 'required',
'phone' => 'required',
// 'country' => 'required',
// 'profile_image' => 'required',
'email' => 'required|email|unique:user,email,'.$this->emp_id.',user_id'
        ];

        $validator = Validator::make($data, $rules);

        if ($validator->fails()) {
            return Base::touser($validator->errors()->all()[0]);
        }


        $user = new User();
        $user = $user->where('user_id', '=', $this->emp_id)->first();
        $user->first_name = $data['first_name'];
        $user->last_name = $data['last_name'];
        $user->phone = $data['phone'];
        $user->street = $data['street'];
        $user->email = $data['email'];

        // $user->city = $data['city'];
        // $user->street = $data['street'];
        // $user->state = $data['state'];
        // $user->zipcode = $data['zipcode'];
        // $user->email = $data['email'];
        // $user->state = $data['state'];
        // $user->zipcode = $data['zipcode'];
        // $user->country = $data['country'];

        if(isset($data['profile_image']))
        {
        $user->profile_image = json_encode($data['profile_image'], true);
        }


        $user->save();
        return Base::touser('Profile Updated', true);
    }



        public function updateActivity(Request $request)
        {
            $data = $request->input('data');

            $rules = [
                     'activity' => 'required'
            ];

            $validator = Validator::make($data, $rules);

            if ($validator->fails()) {
                return Base::touser($validator->errors()->all()[0]);
            }
            $user = new User();
            $user = $user->where('user_id', '=', $this->emp_id)->first();
            $user->activity = $data['activity'];
            $user->save();

            // Active
            // In Active
            // Offline

// if($user->activity  == 'Offline')
// {

           $api =  \App\Models\TravelHistory::where('user_id','=', $user->user_id)
           ->orderBy('timestamp', 'desc')
           ->first();

if ($api === null) {

}
else
{
           event(new \App\Events\LocationUpdate($api, $this->emp_id));
}


// }

            return Base::touser('Profile Updated', true);
        }



    public function reset_password(Request $request)
    {
        $data = $request->input('data');


        $rules = [
'old_password' => 'required',
'new_password' => 'required',
'confirm_password' => 'required|same:new_password',
        ];


        $validator = Validator::make($data, $rules);

        if ($validator->fails()) {
            return Base::touser($validator->errors()->all()[0]);
        }



        try {
            $reset = User::find($this->emp_id);

            if ((decrypt($reset->user_pwd) === $data['old_password'])) {
                $reset->user_pwd = encrypt($data['new_password']);
                $reset->save();
                return Base::touser('Password Changed', true);
            }
            return Base::touser('Old Password Incorrect');
        } catch (\Exception $e) {
            return Base::throwerror();
        }
    }
}
