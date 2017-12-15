 <?php 

 public  function web_auth(Request $request)
    {

        if (null == $request->input('data')) {
           
           abort(401);
        }


        $data = $request->input('data');

        $rules = [
            'email' => 'required|email',
            'password' => 'required|min:3',

        ];

        $validator = Validator::make($data, $rules);

        if ($validator->fails()) return $this->touser($validator->errors()->all()[0]);


        $valid = User::where('email', $data['email'])->first();


        $exits = (int)count($valid);


        if ($exits == 1) {


            if ((decrypt($valid->user_pwd) === $data['password'])) {

                if ($valid->is_active == 1) {


                    $key = self::token($valid->user_id, User::class); //logged


                    return $this->touser($key, true);

                } else {
                    return $this->touser('Account not activated');
                }

            } else {
                return $this->touser('Password Not Match');
            }


        } elseif (slef::is_app_domain()) {


if(count(master::where('email', $data['email'])->first()) == 1)
{

            $valid = master::where('email', $data['email'])->first();


            if ((decrypt($valid->pwd) === $data['password'])) {

                if ($valid->is_active == 1) {


                    $key = self::token($valid->id, master::class); //logged


                    return $this->touser($key, true);
                } else {
                    return $this->touser('Account not activated');
                }

            } else {
                return $this->touser('Password Not Match');
            }

        } else {
            return $this->touser('No Account Found');
        }
}
else {
            return $this->touser('No Account Found');
        }

    }