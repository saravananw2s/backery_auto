<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Base;
use App\Models\Customer;
use Illuminate\Http\Request;
use Validator;

class CustomersController extends Controller
{
    public function index()
    {


        $loggedUser = \App\Models\User::find($this->emp_id);
          $belongsemp = [];
        if($loggedUser)
        {
      

        $belongsemp[] = $loggedUser->user_id;


        if($loggedUser->belongs_manager)
        {
           
            $temp = Base::getEmpBelongsUser($loggedUser->belongs_manager);
            $temp1 = Base::getEmpBelongsUser($loggedUser->user_id);

            $temp = array_merge($temp,$temp1);
            if(is_array($temp))
            {
                 array_push($belongsemp,$temp);
            }
        }

        }

        if ($this->role === 'user') {

            if(count($belongsemp) > 0)
            {
                 return Base::touser(Customer::whereIn('emp_id',$belongsemp)->get(), true);

            } 
            
            return Base::touser(Customer::all(), true);


        } else {



            if(count($belongsemp) > 0)
            {
                  $data = Customer::whereIn('emp_id',$belongsemp)->with('emp')->get()->toArray();

            }
            else
            {
                 $data = Customer::with('emp')->get()->toArray();
            }




                
            



            foreach ($data as $key => $value) {


                $data[$key]['emp'] = $data[$key]['emp']['last_name'] .' '. $data[$key]['emp']['first_name'];


                $data[$key]['full_address'] = '';

                if (trim($data[$key]['location'])) {
                    $data[$key]['full_address'] = $data[$key]['location'] . ',';
                }
                if (trim($data[$key]['address'])) {
                    $data[$key]['full_address'] .= $data[$key]['address'] . ',';
                }

                if (trim($data[$key]['district'])) {
                    $data[$key]['full_address'] .= $data[$key]['district'] . ',';
                }

                if (trim($data[$key]['city'])) {
                    $data[$key]['full_address'] .= $data[$key]['city'] . ',';
                }

                if (trim($data[$key]['state'])) {
                    $data[$key]['full_address'] .= $data[$key]['state'] . ',';
                }

                if (trim($data[$key]['country'])) {
                    $data[$key]['full_address'] .= $data[$key]['country'];
                }

                if (trim($data[$key]['zipcode'])) {
                    $data[$key]['full_address'] .= $data[$key]['zipcode'];
                }



            }

            return Base::touser($data, true);
        }
    }

    public function store(Request $request)
    {
        $data = $request->input('data');

        $rules = [
            'name'       => 'required|unique:customers',
// 'address' => 'required',
            'contact_no' => 'required',
            'loc_lat'    => 'required',
            'loc_lng'    => 'required',
// 'address' => 'required',
            // 'contact_person' => 'required',
            // 'city' => 'required',
            // 'state' => 'required',
            // 'country' => 'required',
            // 'zipcode' => 'required',
            // 'type'       => 'required',
           // 'emp_id'     => 'required|exists:user,user_id',
// 'district' => 'required',
            'email'      => 'required|email|unique:customers',
        ];

        $validator = Validator::make($data, $rules);

        if ($validator->fails()) {
            return Base::touser($validator->errors()->all()[0]);
        }

        $Customer        = new Customer();
        $Customer->name  = $data['name'];
        $Customer->email = $data['email'];
        $Customer->desc  = isset($data['desc']) ? $data['desc'] : null;

        $Customer->country = isset($data['country']) ? $data['country'] : null;

        $Customer->pan = isset($data['pan']) ? $data['pan'] : null;
        $Customer->tin = isset($data['tin']) ? $data['tin'] : null;

        $Customer->location = isset($data['location']) ? $data['location'] : null;


        $Customer->emp_id   = isset($data['emp_id']) ? $data['emp_id'] : $this->emp_id;

        $Customer->uploads = json_encode($data['uploads']);

        $Customer->district = isset($data['district']) ? $data['district'] : null;
        $Customer->address  = isset($data['address']) ? $data['address'] : null;
        $Customer->city     = isset($data['city']) ? $data['city'] : null;
        $Customer->state    = isset($data['state']) ? $data['state'] : null;
        $Customer->zipcode  = isset($data['zipcode']) ? $data['zipcode'] : null;

        $Customer->loc_lat = $data['loc_lat'];
        $Customer->loc_lng = $data['loc_lng'];

        $Customer->contact_person = isset($data['contact_person']) ? $data['contact_person'] : null;
        $Customer->contact_no     = $data['contact_no'];



        $Customer->type  =  isset($data['type']) ? $data['type'] : null;
        $Customer->save();

        return Base::touser('Customer Created', true);
    }

    /**
     * Display the specified resource.
     *
     *  @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {

        $data = Customer::find($id)->toArray();
           
                $data['full_address'] = '';

                if (trim($data['location'])) {
                    $data['full_address'] = $data['location'] . ',';
                }
                if (trim($data['address'])) {
                    $data['full_address'] .= $data['address'] . ',';
                }

                if (trim($data['district'])) {
                    $data['full_address'] .= $data['district'] . ',';
                }

                if (trim($data['city'])) {
                    $data['full_address'] .= $data['city'] . ',';
                }

                if (trim($data['state'])) {
                    $data['full_address'] .= $data['state'] . ',';
                }

                if (trim($data['country'])) {
                    $data['full_address'] .= $data['country'];
                }

                if (trim($data['zipcode'])) {
                    $data['full_address'] .= $data['zipcode'];
                }

 

        return Base::touser($data, true);
    }

    public function update(Request $request, $id)
    {
        $data = $request->input('data');

        $rules = [
            'name'       => 'required|unique:customers,name,' . $id . ',id',
            // 'address'        => 'required',
            'contact_no' => 'required',
            // 'loc_lat'        => 'required',
            // 'loc_lng'        => 'required',
            // 'address'        => 'required',
            // 'contact_person' => 'required',
            // 'city'           => 'required',
            // 'state'          => 'required',
            // 'country'        => 'required',
            // 'zipcode'        => 'required',
            //'type'       => 'required',
            'emp_id'     => 'required|exists:user,user_id',
            // 'district'       => 'required',
            'email'      => 'required|email|unique:customers,email,' . $id . ',id',
        ];

        $validator = Validator::make($data, $rules);

        if ($validator->fails()) {
            return Base::touser($validator->errors()->all()[0]);
        }

        \DB::beginTransaction();

        try {
            $Customer        = new Customer();
            $data            = $request->input('data');
            $Customer        = $Customer->where('id', '=', $id)->first();
            $Customer->name  = $data['name'];
            $Customer->email = $data['email'];
            $Customer->desc  = isset($data['desc']) ? $data['desc'] : null;

            $Customer->country = isset($data['country']) ? $data['country'] : null;

            $Customer->pan = isset($data['pan']) ? $data['pan'] : null;
            $Customer->tin = isset($data['tin']) ? $data['tin'] : null;

            $Customer->location = isset($data['location']) ? $data['location'] : null;



            if($this->manager)
            {
                    
                    $belongsemp = Base::getEmpBelongsUser($this->emp_id);
                    if(!in_array($Customer->emp_id, $belongsemp))
                    {
                        
                    return Base::touser('Customer not belongs to your team', false);
   
                    }

            }


              $Customer->emp_id   = isset($data['emp_id']) ? $data['emp_id'] : $this->emp_id;



            $Customer->uploads = json_encode($data['uploads']);

            $Customer->district = isset($data['district']) ? $data['district'] : null;
            $Customer->address  = isset($data['address']) ? $data['address'] : null;
            $Customer->city     = isset($data['city']) ? $data['city'] : null;
            $Customer->state    = isset($data['state']) ? $data['state'] : null;
            $Customer->zipcode  = isset($data['zipcode']) ? $data['zipcode'] : null;

            $Customer->loc_lat = $data['loc_lat'];
            $Customer->loc_lng = $data['loc_lng'];

            $Customer->contact_person = isset($data['contact_person']) ? $data['contact_person'] : null;
            $Customer->contact_no     = $data['contact_no'];
                 $Customer->type  =  isset($data['type']) ? $data['type'] : null;
            $Customer->save();
        } catch (Exception $e) {
            \DB::rollBack();

            throw $e;
        }

        \DB::commit();

        return Base::touser('Customer Updated', true);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {


        try {

            $api = new Customer();
            $api = $api->find($id);
            $api->delete();
            return Base::touser('Customer Deleted', true);

        } catch (\Exception $e) {

            return Base::touser("Can't able to delete Customer its connected to Other Data !");
            //return Base::throwerror();
        }



    }
}
