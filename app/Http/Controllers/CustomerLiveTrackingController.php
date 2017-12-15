<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Base;
use App\Models\EmpCustSchedule as emp_cust;
use App\Models\TravelHistory as api;
use Illuminate\Http\Request;

class CustomerLiveTrackingController extends Controller
{

    public function show(Request $request, $order_id)
    {

        // try {

            $order_id = decrypt($order_id);
            $data     = emp_cust::where('id', $order_id)->get()->toArray()[0];

            if ($data) {

                $tracking_order = $data;


                if ($data['allocated_emp_id']) {
                    $tracking_order['emp_info']                  = \App\Models\User::where('user_id', $data['allocated_emp_id'])->get(['user_id', 'first_name', 'last_name', 'phone', 'profile_image'])->toArray()[0];
                    $tracking_order['emp_info']['profile_image'] = json_decode($tracking_order['emp_info']['profile_image']);
                    $tracking_order['emp_info']['geo']           = api::where('user_id', $data['allocated_emp_id'])->get(['lat', 'lng', 'timestamp'])->last();
                    $tracking_order['emp_info']['socket_id']     = $data['allocated_emp_id'];
                    $tracking_order['review']                    = \App\Models\Review::where('task_id', $order_id)->get()->toArray();
                    unset($tracking_order['emp_info']['user_id']);
                }



                return view('customer_tracking_view', ['order_info' => json_encode($tracking_order, true)]);

            } else {
                Base::app_unauthorized();
            }
        // } catch (\Exception $e) {

        //     Base::app_unauthorized();

        // }

    }
}
