<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Base;
use App\Models\User;
use App\Models\UserRole;
use Illuminate\Http\Request;
use App\Models\Customer as Customers;
use Validator;

class UserController extends Controller
{
    public function index(Request $request)
    {

        // try {
            if ($this->admin || $this->backend) {

                if ($request->input('active')) {
                    $data = User::with('role')
                    ->where('is_active', 1)
                     ->whereIn('role_id', [1,2])->
                    get()->toArray();

                } else {
                    $data = User::with('role')->get()->toArray();
                }

                foreach ($data as $key => $value) {

                    $data[$key]['role'] = $data[$key]['role']['display_name'];

                }
                return Base::touser($data, true);

            } elseif ($this->manager) {

                if ($request->input('active')) {

                    $data = User::with('role')
                         ->where('is_active', 1)
                        ->whereIn('role_id', [1,2])
                        ->where('belongs_manager', $this->emp_id)
                        ->orWhere('user_id', $this->emp_id)

                        ->get()->toArray();
                } else {

                    $data = User::with('role')->where('belongs_manager', $this->emp_id)->
                        orWhere('user_id', $this->emp_id)
                        ->get()->toArray();
                }

                foreach ($data as $key => $value) {

                    $data[$key]['role'] = $data[$key]['role']['display_name'];

                }

                return Base::touser($data, true);
            } else {
                return Base::throwerror();
            }
        // } catch (\Exception $e) {
        //     return Base::throwerror();
        // }
    }

    public function resetpassword(Request $request)
    {
        $rules = [
            'new_password'     => 'required',
            'confirm_password' => 'required|same:new_password',
            'user_id'          => 'exists:user,user_id',
        ];

        $data = $request->input('data');

        $validator = Validator::make($data, $rules);

        if ($validator->fails()) {
            return Base::touser($validator->errors()->all()[0]);
        }

        // try {
            if ($this->admin || $this->backend) {
                $reset = User::find($data['user_id']);
            } elseif ($this->manager) {
                $reset = User::where('user_id',$data['user_id'])->first();
            } else {
                return Base::throwerror();
            }

            $reset->user_pwd = encrypt($data['new_password']);

            $reset->save();

            return Base::touser('Password Changed', true);
        // } catch (\Exception $e) {
        //     return Base::throwerror();
        // }
    }

    public function resetpasswordbyemp(Request $request)
    {
        $rules = [
            'new_password'     => 'required',
            'confirm_password' => 'required|same:new_password',
        ];

        $data = $request->input('data');

        $validator = Validator::make($data, $rules);

        if ($validator->fails()) {
            return Base::touser($validator->errors()->all()[0]);
        }

        try {
            $reset           = User::find($this->emp_id);
            $reset->user_pwd = encrypt($data['new_password']);
            $reset->save();
            return Base::touser('Password Changed', true);
        } catch (\Exception $e) {
            return Base::throwerror();
        }
    }

    public static function roles()
    {
        return Base::touser(UserRole::all(), true);
    }

    public static function managers()
    {
        try {
            $manager = UserRole::where('name', Base::manager())->get()->toArray();

            $role = $manager[0]['role_id'];

            return Base::touser(User::where('role_id', $role)->get(), true);
        } catch (\Exception $e) {
            return Base::throwerror();
        }
    }

    public function store(Request $request)
    {
        $rules = [
            'role_id'    => 'required',
            'first_name' => 'required',
            'last_name'  => 'required',
            'phone'      => 'required',
            // 'street'        => 'required',
            // 'city'          => 'required',
            // 'state'         => 'required',
            'zipcode'       => 'required',
            // 'country'       => 'required',
            // 'profile_image' => 'required',
            'email'      => 'required|email|unique:user',
        ];

        $data = $request->input('data');

        $validator = Validator::make($data, $rules);

        if ($validator->fails()) {
            return Base::touser($validator->errors()->all()[0]);
        }

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
            $user->zipcode = isset($data['zipcode']) ? $data['zipcode'] : 0;
        $user->country = isset($data['country']) ? $data['country'] : null;

        $user->profile_image = isset($data['profile_image']) ? json_encode($data['profile_image'], true) : '[]';

        $user->phone_imei = isset($data['phone_imei']) ? $data['phone_imei'] : '';
        $user->is_active  = isset($data['is_active']) ? $data['is_active'] : 0;

        if ($data['role_id'] == 1) {

            if ($this->admin || $this->backend) {

                if (empty($data['belongs_manager'])) {

                    return Base::touser('Sale Person must have belongs to manager');
                }

                $user->belongs_manager = isset($data['belongs_manager']) ? $data['belongs_manager'] : null;

            } elseif ($this->manager) {

                $user->belongs_manager = $this->emp_id;

            } else {
            }
        }

        $user->save();


            if ($data['role_id'] == 2)
            {


                $user->belongs_manager = $user->user_id;

                  $user->save();

            }

        \App\Http\Controllers\NotificationsController::WelcomeEmp($user);
        return Base::touser('Employee Created', true);
    }

    public function show(Request $request,$id)
    {
        try {
            if ($this->admin || $this->backend) {


            if(!empty($request->input('belongs')))
            {

              $data = User::with('role')->with('cust')->find($id)->toArray();

             }
             else
             {
                  $data = User::with('role')->find($id)->toArray();
             }





                $data['role'] = $data['role']['display_name'];

                return Base::touser($data, true);

            } elseif ($this->manager) {

                if(!empty($request->input('belongs')))
            {


                $data = User::with('role')->with('cust')->where('belongs_manager', $this->emp_id)

                    ->where('user_id', $id)->get()->toArray()[0];

             }
             else
             {

                $data = User::with('role')->where('belongs_manager', $this->emp_id)

                    ->where('user_id', $id)->get()->toArray()[0];
             }





                $data['role'] = $data['role']['display_name'];

                return Base::touser($data, true);
            } else {
                return Base::throwerror();
            }
        } catch (\Exception $e) {
            return Base::throwerror();
        }
    }

    public function update(Request $request, $id)
    {
        $data = $request->input('data');

        $rules = [
            'role_id'    => 'required',
            'first_name' => 'required',
            'last_name'  => 'required',
            // 'street'        => 'required',
            // 'city'          => 'required',
            // 'state'         => 'required',
            'zipcode'       => 'required',
            //             'country'       => 'required',
            'phone'      => 'required',

            // 'profile_image' => 'required',
            'email'      => 'required|email|unique:user,email,' . $id . ',user_id',
        ];

        $validator = Validator::make($data, $rules);

        if ($validator->fails()) {
            return Base::touser($validator->errors()->all()[0]);
        }

        $user             = new User();
        $user             = $user->where('user_id', '=', $id)->first();
        $user->role_id    = $data['role_id'];
        $user->first_name = $data['first_name'];
        $user->last_name  = $data['last_name'];

        $user->user_pwd = isset($data['user_pwd']) ? $data['user_pwd'] : $user->user_pwd;
        $user->phone    = $data['phone'];
        $user->email    = $data['email'];

        $user->city    = isset($data['city']) ? $data['city'] : null;
        $user->street  = isset($data['street']) ? $data['street'] : null;
        $user->state   = isset($data['state']) ? $data['state'] : null;
         $user->zipcode = isset($data['zipcode']) ? $data['zipcode'] : 0;
        $user->country = isset($data['country']) ? $data['country'] : null;

        $user->profile_image = isset($data['profile_image']) ? json_encode($data['profile_image'], true) : '[]';
        $user->phone_imei    = isset($data['phone_imei']) ? $data['phone_imei'] : '';



        $user->is_active     = isset($data['is_active']) ? $data['is_active'] : 0;



        if ($data['role_id'] == 1) {

            if ($this->admin || $this->backend) {

                if (empty($data['belongs_manager'])) {

                    return Base::touser('Sale Person must have belongs to manager');
                }

                $user->belongs_manager = isset($data['belongs_manager']) ? $data['belongs_manager'] : null;
            } elseif ($this->manager) {

                $user->belongs_manager = $this->emp_id;
            } else {
            }
        }

        $user->save();


        if($user->is_active  == 0 && $data['role_id'] == 1)
        {


            $customers = new Customers;

            $customers->where('emp_id',$user->user_id)->update(array('emp_id' => $user->belongs_manager));


        }
        return Base::touser('Employee Updated', true);
    }

    public function destroy($id)
    {

        try {

            $api = new User();
            $api = $api->find($id);
            $api->delete();
            return Base::touser('Employee Deleted', true);

        } catch (\Exception $e) {

            return Base::touser("Can't able to delete Employee its connected to Other Data !");
            //return Base::throwerror();
        }

    }

    public function recover(Request $request)
    {
        $api  = new User();
        $id   = $request->input('id');
        $user = $api->onlyTrashed()->where('user_id', '=', $id)->first();
        $user->restore();
        return Base::touser('Employee Recovered', true);
    }
}
