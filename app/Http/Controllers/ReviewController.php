<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;


use App\Models\Review;

use App\Http\Controllers\Base;
use Validator;

class ReviewController extends Controller
{
    public function index()
    {
        if($this->admin)
        {
        $data = Review::all();
        return Base::touser($data, true);
      }

    if($this->manager)
        {
               $belongsemp = Base::getEmpBelongsUser($this->emp_id);


            $array = Review::with('cust','emp_info')->whereIn('emp_id', $belongsemp)->get()->toArray();



            foreach ($array as $key => $value) {

                $array[$key]['emp_info'] = $array[$key]['emp_info']['first_name'] . ' ' . $array[$key]['emp_info']['last_name'];
            }
        return Base::touser($array, true);
      }





    }


    public function CustomerReview(Request $request,$order_id)
    {
        $data = $request->input('data');
        $data['order_id'] = $order_id;

        $rules = [
'stars' => 'required|int',
'review' => 'required|string',
'order_id' => 'required',
        ];

        $validator = Validator::make($data, $rules);

        if ($validator->fails()) {
            return Base::touser($validator->errors()->all()[0]);
        }


        $order_id = decrypt($order_id);


        $order_info = \App\Models\EmpCustSchedule::where('id',$order_id)->get()->toArray()[0];
        $review =Review::where('task_id',$order_id)->first();



        if(!$review)
        {
            $review = new Review();

        }


        $review->cust_id = $order_info['cust_id'];
        $review->date = date('Y-m-d');
        $review->task_id = $order_info['id'];
        $review->emp_id = $order_info['allocated_emp_id'];
        $review->stars = $data['stars'];
        $review->review = $data['review'];
        $review->save();

        return Base::touser('Thanks for your Review', true);
    }


    public function show($id)
    {
        return Base::touser(Review::find($id), true);
    }

}
