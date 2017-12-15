<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Base;
use App\Models\Customer;
use App\Models\EmpCustSchedule as task;
use App\Models\EmpSchedule as allocation;
use App\Models\ScheduleTaskStatus;
use App\Models\TravelHistory as api;
use Illuminate\Http\Request;
use Illuminate\Pagination\LengthAwarePaginator;
use Toin0u\Geotools\Facade\Geotools;
use Validator;

class ApiEmpScheduleController extends Controller
{
    public function index(Request $request)
    {
        if ($this->admin || $this->backend) {
            $array = task::with('cust')->orderBy('schedule_date_time', 'asc')->all()->toArray();

        } elseif ($this->manager) {

            $belongsemp = Base::getEmpBelongsUser($this->emp_id);

            if ($request->input('date')) {
                $value = Base::tomysqldate($request->input('date'));
                $array = task::where('added_by', $this->emp_id)->
                    where(\DB::raw("date(schedule_date_time)"), $value)->
                    with('cust')->orderBy('schedule_date_time', 'desc')->get()->toArray();
            }
            elseif($request->input('start') && $request->input('end')) {

                $start = Base::tomysqldate($request->input('start')) . ' 00:00:00';
                $end = Base::tomysqldate($request->input('end')) . ' 23:59:00';
                $array = task::where('added_by', $this->emp_id)
                ->where('schedule_date_time', '<=',$end)
                ->where('schedule_date_time','>=',$start)
                 ->with('cust')->orderBy('schedule_date_time', 'desc')->get()->toArray();


            }
             else {
                $array = task::where('added_by', $this->emp_id)->with('cust')->get()->toArray();
            }

        } else {

            if ($request->input('date')) {
                $value = Base::tomysqldate($request->input('date'));
            } else {
                $value = date('Y-m-d');
            }

            $result = allocation::where('emp', $this->emp_id)
                ->wherehas('task', function ($q) use ($value) {
                    $q->where(\DB::raw("date(schedule_date_time)"), $value);
                })
                ->with('task')->get()->toArray();
            $Allocated  = [];
            $InProgress = [];
            $Incomplete = [];
            $Delivered  = [];

            foreach ($result as $key => $data) {

                if ($data['task']['status'] == "Allocated") {
                    $Allocated[] = $data;
                } elseif ($data['task']['status'] == "In-Progress") {
                    $InProgress[] = $data;
                } elseif ($data['task']['status'] == "Incomplete") {

                  $Summary = self::gpsData($data['task']['id'],false);

                    if($Summary == 'error')
                    {
                           $data['task']['task_info'] = new \stdClass;
                    }
                    else
                    {
                              $data['task']['task_info'] = $Summary;
                    }


                    $Incomplete[] = $data;
                } elseif ($data['task']['status'] == "Delivered") {


                                 $Summary = self::gpsData($data['task']['id'],false);

                    if($Summary == 'error')
                    {

                           $data['task']['task_info'] = new \stdClass;
                    }
                    else
                    {
                              $data['task']['task_info'] = $Summary;
                    }

                    $Delivered[] = $data;
                } else {

                }

            }


            if($request->input('filterStatus') == 'deliveries')
            {
                $dataBag = array_merge(
                $Incomplete,
                $Delivered);
            }
            else
            {

            $dataBag = array_merge(
                $InProgress,
                $Allocated,
                $Incomplete,
                $Delivered);
            }



            if (\Request::get('page')) {
                $perPage             = 10;
                $pageStart           = \Request::get('page', 1);
                $offSet              = ($pageStart * $perPage) - $perPage;
                $itemsForCurrentPage = array_slice($dataBag, $offSet, $perPage);

                $paginator = new LengthAwarePaginator($itemsForCurrentPage, count($dataBag), $perPage);

                $paginator->withPath(url()->current() . '?date=' . $value);

                return $paginator;
            }

            return Base::touser($dataBag, true);
        }
        return Base::touser($array, true);
    }

    public function updateTaskStatus(Request $request, $task_id)
    {

        $rules = [
            'status'     => 'required',
            'lat'        => 'required',
            'timestamps' => 'required',
            'lng'        => 'required',
        ];

        $data = $request->input('data');

        $validator = Validator::make($data, $rules);

        if ($validator->fails()) {

            return Base::touser($validator->errors()->all()[0]);
        }

        $task = task::find($task_id);

        if ($data['status'] == 'Declined') {

            $temp = allocation::where('task_id', $task_id)->
                where('emp', $this->emp_id)->delete();
            $data['status'] = 'Unallocated';
        }
        else
        {

        }


        $task_status             = new ScheduleTaskStatus();
        $task_status->emp_id     = $this->emp_id;
        $task_status->task_id    = $task_id;
        $task_status->address    = '';
        $task_status->lat        = $data['lat'];
        $task_status->long       = $data['lng'];
        $task_status->status     = $data['status'];
        $task_status->timestamps = isset($data['timestamps']) ? Base::tomysqldatetime($data['timestamps']) : date("Y-m-d H:i:s");
        $task_status->save();

         event(new \App\Events\TaskUpdateEvent($task, $this->emp_id));
        return Base::touser('Status Updated', true);



    }

    public function getTaskSummary(Request $request, $task_id)
    {

        return self::gpsData($task_id);

    }

    public function gpsData($task_id, $apicall = true)
    {

        try
        {
        $task = task::where('id', $task_id)->with('all_status')->first();
        if($task)
        {
            $task = $task->toArray();
        }
    }
    catch (\Exception $e)
    {
              if ($apicall) {
                return Base::touser('Task not found');
            } else {
                return 'error';
            }
    }
        if (count($task) < 1) {
            if ($apicall) {
                return Base::touser('Task not found');
            } else {
                return 'error';
            }
        } else {

            if (count($task['all_status']) < 1) {
                if ($apicall) {

                    return Base::touser('Task Status not found');

                } else {
                    return 'error';
                }
            }

            if ($apicall) {
                if ((Base::mobile_header() == 1) && ($task['allocated_emp_id'] != $this->emp_id)) {
                    return Base::touser('Task Status not belongs to you');
                }
            }

            $taskStatus = array_reverse($task['all_status']);

            $Progress = array_first($taskStatus, function ($value, $key) use ($task) {

                if ($value['emp_id'] == $task['allocated_emp_id']) {
                    return $value['status'] == 'In-Progress';
                }

            });

            $Delivered = array_first($taskStatus, function ($value, $key) use ($task) {

                if ($value['emp_id'] == $task['allocated_emp_id']) {

                    return $value['status'] == 'Delivered';
                }

            });
            $Incomplete = array_first($taskStatus, function ($value, $key) use ($task) {

                if ($value['emp_id'] == $task['allocated_emp_id']) {
                    return $value['status'] == 'Incomplete';
                }
            });

            if ($Progress) {
                if ($Delivered || $Incomplete) {

                     $data = $Delivered ? $Delivered : $Incomplete;
                    if ($data['timestamps']) {
                        $end = $data['timestamps'];
                    } else {
                        $end = $data['created_at'];
                    }
                }


                    if ($Progress['timestamps']) {
                        $start = $Progress['timestamps'];
                    } else {
                        $start = $Progress['created_at'];
                    }
                    $end = isset($end) ? $end : Base::current_client_datetime();

                    //$end = isset($end) ? $end : date('Y-m-d H:i:s');

                    // $end = "2017-07-04 05:35:00";
                    $start = $start;
                                 if ($apicall) {

                                                       $gpsData = api::
                        orderBy('timestamp', 'asc')->
                        where('user_id', $task['allocated_emp_id'])->
                        where('timestamp', '<=', Base::tomysqldatetime($end))->
                        where('timestamp', '>=', Base::tomysqldatetime($start))->
                        get()->toArray();
      } else {


    $gpsData = [];
                    }

                    $distInMeter = [];
                     $distInMeter[] = 0;
                    for ($x = 0; $x < count($gpsData) - 1; $x++) {

                        if( ($gpsData[$x]['activity'] == 'Start'))
                        {

                            $distInMeter[] =  $distInMeter[count( $distInMeter)-1];
                            $distInMeter[] = 0;
                        }
                        else
                        {
                        $data1                   = $gpsData[$x];
                        $data2                   = $gpsData[$x + 1];
                        $gpsData[$x]['path']     = [$data1['lat'], $data1['lng']];
                        $gpsData[$x + 1]['path'] = [$data2['lat'], $data2['lng']];
                        $coordA                  = Geotools::coordinate($gpsData[$x]['path']);
                        $coordB                  = Geotools::coordinate($gpsData[$x + 1]['path']);
                        $distance                = Geotools::distance()->setFrom($coordA)->setTo($coordB);
                        $distInMeter[count( $distInMeter)-1]  = $distance->flat() + $distInMeter[count( $distInMeter)-1];
                        }


                    }

                    $distInMeter = array_sum($distInMeter);

                    $time_taken = Base::time_elapsed_string($end, true, $start);

                    if (empty($time_taken)) {
                        $time_taken = '1 min';

                    }

                    $distInMeter = $distInMeter / 1000;

                    if ($apicall) {
                        $Summary = [
                            'time_taken' => $time_taken,
                            'start'      => $start,
                            'end'        => $end,
                            'gpsData'    => $gpsData,
                            'distance'   => round($distInMeter, 2) . ' kms',
                        ];

                        return Base::touser($Summary, true);

                    } else {

                           $Summary = [
                            'time_taken' => $time_taken,
                            'start'      => $start,
                            'end'        => $end,
                            'distance'   => round($distInMeter, 2) . ' kms',
                        ];
                        return (object) $Summary;
                    }


            }

            if ($apicall) {

                return Base::touser('Task Status Error');
            } else {
                return 'error';
            }

        }
    }

    public function updatetask(Request $request, $task_id)
    {

        $rules = [
            'status'           => 'required',
            'lat'              => 'required',
            'timestamps'       => 'required',
            'lng'              => 'required',
            // 'is_cust_delivery' => 'required',
        ];

        $data      = $request->input('data');
        $validator = Validator::make($data, $rules);

        if ($validator->fails()) {

            return Base::touser($validator->errors()->all()[0]);
        }

        $task = task::find($task_id);

        if (count($task) < 1) {
            return Base::touser('Task not found');
        }
             if ($task->status == 'Delivered' || $task->status == 'Incomplete') {
            return Base::touser('Task Already Completed', true);
        }



        $reqlat    = $request->input('data')['lat'];
        $reqlng    = $request->input('data')['lng'];
        $timestamp = isset($request->input('data')['timestamps']) ? Base::tomysqldatetime($request->input('data')['timestamps']) : date('Y-m-d H:i:s');
        $remarks   = isset($request->input('data')['remarks']) ? $request->input('data')['remarks'] : '';


        if ($task->is_geo_fence == 1) {
            $coordA   = Geotools::coordinate([$reqlat, $reqlng]);
            $coordB   = Geotools::coordinate([$task->loc_lat, $task->loc_lng]);
            $distance = Geotools::distance()->setFrom($coordA)->setTo($coordB);
            if ($distance->flat() > $task->geo_fence_meter) {

                 // return Base::touser('Customer Location must be within ' . $task->geo_fence_meter . ' meters'. $distance->flat());
                return Base::touser('Customer Location must be within ' . $task->geo_fence_meter . ' meters');
            }
        }

        $task->delivery_time       = $timestamp;
        $task->delivery_to      = isset($request->input('data')['delivery_to']) ? $request->input('data')['delivery_to'] : '';
        $task->delivery_phone   = isset($request->input('data')['delivery_phone']) ? $request->input('data')['delivery_phone'] : '';
        $task->is_cust_delivery = isset($request->input('data')['is_cust_delivery']) ? $request->input('data')['is_cust_delivery'] : 1;
        $task->remarks          = isset($remarks) ? $remarks : '';
        $task->lat              = $reqlat;
        $task->lng              = $reqlng;
        $task->signature        = isset($request->input('data')['signature']) ? $request->input('data')['signature'] : '';
        $task->images           = isset($request->input('data')['images']) ? json_encode($request->input('data')['images']) : '[]';
        $task->save();


        $task_status             = new ScheduleTaskStatus();
        $task_status->emp_id     = $this->emp_id;
        $task_status->task_id    = $task->id;
        $task_status->address    = '';
        $task_status->lat        = $data['lat'];
        $task_status->long       = $data['lng'];
        $task_status->status     = $data['status'];
        $task_status->timestamps = $timestamp;
        $task_status->save();

        $user         = \App\Models\User::find($this->emp_id);
        $notification = $user->notify(new \App\Notifications\TaskCompleted($task, $user));
        event(new \App\Events\NotificationEvent($user));
        event(new \App\Events\TaskUpdateEvent($task, $this->emp_id));

        return Base::touser('Task Updated', true);

    }

    public function allocateTask(Request $request, $task_id)
    {
        $rules = [
            'emp'    => 'exists:user,user_id',
            'status' => 'required|string',
        ];

        $data      = $request->input('data');
        $validator = Validator::make($data, $rules);
        if ($validator->fails()) {
            return Base::touser($validator->errors()->all()[0]);
        }

        $task = task::where('id', $task_id)->first();

        $task_status             = new ScheduleTaskStatus();
        $task_status->emp_id     = isset($data['emp']) ? $data['emp'] : $this->emp_id;
        $task_status->task_id    = $task->id;
        $task_status->address    = '';
        $task_status->lat        = '';
        $task_status->long       = '';
        $task_status->status     = isset($data['status']) ? $data['status'] : 'Unallocated';
        $task_status->timestamps = isset($data['timestamps']) ? Base::tomysqldatetime($data['timestamps']) : date("Y-m-d H:i:s");
        $task_status->save();

        if (($task_status->status != 'Unallocated') && ($task_status->status != 'Canceled')) {
            if (empty($data['emp'])) {
                return Base::touser('Employee Required');
            }

            $allocation          = new allocation();
            $allocation->emp     = $data['emp'];
            $allocation->add_by  = isset($data['added_by']) ? $data['added_by'] : $this->emp_id;
            $allocation->task_id = $task->id;
            $allocation->save();

            $user = \App\Models\User::find($allocation->emp);
            $user->notify(new \App\Notifications\TaskAllocated($task, $user));
            // $cust = \App\Models\Customer::find($task->cust_id )->notify(new \App\Notifications\CustomerTracking($task, $user, Base::get_domin()));

        }
        return self::show($task->id);
    }

    public function store(Request $request)
    {
        $rules = [
            'emp'                => 'exists:user,user_id',
            'added_by'           => 'exists:user,user_id',
            'schedule_date_time' => 'required',
            'type'               => 'required|string',
            'method'             => 'required|string',
            'notes'              => 'required|string',
        ];
        $data      = $request->input('data');
        $validator = Validator::make($data, $rules);
        if ($validator->fails()) {
            return Base::touser($validator->errors()->all()[0]);
        }

        if (($data['status'] != 'Unallocated') && ($data['status'] != 'Canceled')) {
            if (empty($data['emp'])) {
                return Base::touser('Employee Required');
            }

        }

        $data                     = $request->input('data');
        $task                     = new task();
        $task->schedule_date_time = isset($data['schedule_date_time']) ? Base::tomysqldatetime($data['schedule_date_time']) : date('Y-m-d H:i:s');

        if ($this->admin || $this->backend) {
            if (empty($data['added_by'])) {

                return Base::touser('Admin Must Provide Allocated Employee Value');
            }
            $task->added_by = $data['added_by'];
        } elseif ($this->manager) {
            $task->added_by = $this->emp_id;
        } else {
            $task->added_by = $this->emp_id;
        }

        $is_new_address = false;



        if (empty($data['cust_id'])) {

            $data = $request->input('data');
            $cust = array(
                'name'       => $data['cust_name'],
                'contact_no' => $data['cust_phone'],
                'address'    => $data['cust_address'],
                'email'      => $data['cust_email'],
                'loc_lat'    => $data['loc_lat'],
                'loc_lng'    => $data['loc_lat'],
            );

            $rules = [
                'name'       => 'required',
                'contact_no' => 'required',
                'loc_lat'    => 'required',
                'loc_lng'    => 'required',
                'email'      => 'required|email|unique:customers',
                'address'    => 'required',
            ];
            $validator = Validator::make($cust, $rules);

            if ($validator->fails()) {

                if (($validator->errors()->all()[0] == 'The email has already been taken.')) {
                    $Customer = new Customer();
                    $Customer = $Customer->where('email', $data['cust_email'])->first();

                    goto checkaddress;
                } else {
                    return Base::touser($validator->errors()->all()[0]);
                }

            }


            $Customer             = new Customer();
            $Customer->name       = $data['cust_name'];
            $Customer->email      = $data['cust_email'];
            $Customer->emp_id     = isset($data['added_by']) ? $data['added_by'] : $this->emp_id;
            $Customer->address    = isset($data['cust_address']) ? $data['cust_address'] : null;
            $Customer->loc_lat    = $data['loc_lat'];
            $Customer->loc_lng    = $data['loc_lng'];
            $Customer->contact_no = $data['cust_phone'];
            $Customer->save();
            $data['cust_id'] = $Customer->id;



        } else {
            $Customer = new Customer();
            $Customer = $Customer->where('id', $data['cust_id'])->first();
            checkaddress:

            if ($Customer->contact_no != $data['cust_phone'] || $Customer->address != $data['cust_address'] || $Customer->loc_lat != $data['loc_lat'] || $Customer->loc_lng != $data['loc_lng']) {
                $is_new_address = true;
            }
        }

        $task->cust_id        = $Customer->id;
        $task->type           = $data['type'];
        $task->notes          = $data['notes'];


        if ($is_new_address) {
            $task->cust_phone   = $data['cust_phone'];
            $task->loc_lat      = $data['loc_lat'];
            $task->loc_lng      = $data['loc_lng'];
            $task->cust_address = $data['cust_address'];
        } else {
            $task->cust_phone   = $Customer->contact_no;
            $task->loc_lat      = $Customer->loc_lat;
            $task->loc_lng      = $Customer->loc_lng;
            $task->cust_address = $Customer->address;
        }


        $task->method         = $data['method'];
        $task->is_new_address = $is_new_address;

        if ((isset($data['is_geo_fence'])) && ($data['is_geo_fence'] == 1)) {
            if (isset($data['geo_fence_meter'])) {
                $task->geo_fence_meter = $data['geo_fence_meter'];
                $task->is_geo_fence    = $data['is_geo_fence'];
            } else {
                return Base::touser('Geo Fence Meter Required');
            }

        }

        $task->save();

        $task_status             = new ScheduleTaskStatus();
        $task_status->emp_id     = isset($data['emp']) ? $data['emp'] : $this->emp_id;
        $task_status->task_id    = $task->id;
        $task_status->address    = '';
        $task_status->lat        = '';
        $task_status->long       = '';
        $task_status->status     = isset($data['status']) ? $data['status'] : 'Unallocated';
        $task_status->timestamps = isset($data['timestamps']) ? Base::tomysqldatetime($data['timestamps']) : date("Y-m-d H:i:s");

        $task_status->save();

        if (($task_status->status != 'Unallocated') && ($task_status->status != 'Canceled')) {
            if (empty($data['emp'])) {
                return Base::touser('Employee Required');
            }

            $allocation          = new allocation();
            $allocation->emp     = $data['emp'];
            $allocation->add_by  = isset($data['added_by']) ? $data['added_by'] : $this->emp_id;
            $allocation->task_id = $task->id;
            $allocation->save();

            $user = \App\Models\User::find($allocation->emp);
            $user->notify(new \App\Notifications\TaskAllocated($task, $user));

        }

        $cust = \App\Models\Customer::find($task->cust_id)->notify(new \App\Notifications\CustomerTracking($task, Base::get_domin()));

        return Base::touser('Task Created', true);
    }

    public function show($id)
    {
        // if ($this->admin || $this->backend || $this->manager) {

        $array = task::where('id', $id)->with('all_status')->first()->toArray();

        return Base::touser($array, true);

    }

    public function getWithStatus($id)
    {
        return Base::touser(task::with('cust_jobs')->get()->find($id), true);
    }

    public function update(Request $request, $task_id)
    {
        $rules = [
            'emp'                => 'exists:user,user_id',
            'added_by'           => 'exists:user,user_id',
            'schedule_date_time' => 'required',
            'status'             => 'required',
            'type'               => 'required|string',
            'method'             => 'required',
            'notes'              => 'required|string',

        ];

        $data      = $request->input('data');
        $validator = Validator::make($data, $rules);
        if ($validator->fails()) {
            return Base::touser($validator->errors()->all()[0]);
        }

        if (($data['status'] != 'Unallocated') && ($data['status'] != 'Canceled')) {
            if (empty($data['emp'])) {
                return Base::touser('Employee Required');
            }

        }

        $data                     = $request->input('data');
        $task                     = task::find($task_id);
        $task->schedule_date_time = isset($data['schedule_date_time']) ? Base::tomysqldatetime($data['schedule_date_time']) : date('Y-m-d H:i:s');

        if ($this->admin || $this->backend) {
            if (empty($data['added_by'])) {

                return Base::touser('Admin Must Provide Allocated Employee Value');
            }
            $task->added_by = $data['added_by'];
        } elseif ($this->manager) {
            $task->added_by = $this->emp_id;
        } else {
            $task->added_by = $this->emp_id;
        }

        $is_new_address = false;




        if (empty($data['cust_id'])) {
            $data = $request->input('data');

            $cust = array(
                'name'       => $data['cust_name'],
                'contact_no' => $data['cust_phone'],
                'address'    => $data['cust_address'],
                'email'      => $data['cust_email'],
                'loc_lat'    => $data['loc_lat'],
                'loc_lng'    => $data['loc_lat'],
            );

            $rules = [
                'name'       => 'required',
                'contact_no' => 'required',
                'loc_lat'    => 'required',
                'loc_lng'    => 'required',
                'email'      => 'required|email|unique:customers',
                'address'    => 'required',
            ];
            $validator = Validator::make($cust, $rules);

            if ($validator->fails()) {

                if (($validator->errors()->all()[0] == 'The email has already been taken.')) {
                    $Customer = new Customer();
                    $Customer = $Customer->where('email', $data['cust_email'])->first();

                    goto checkaddress;
                } else {
                    return Base::touser($validator->errors()->all()[0]);
                }

            }

            $Customer             = new Customer();
            $Customer->name       = $data['cust_name'];
            $Customer->email      = $data['cust_email'];
            $Customer->emp_id     = isset($data['added_by']) ? $data['added_by'] : $this->emp_id;
            $Customer->address    = isset($data['cust_address']) ? $data['cust_address'] : null;
            $Customer->loc_lat    = $data['loc_lat'];
            $Customer->loc_lng    = $data['loc_lng'];
            $Customer->contact_no = $data['cust_phone'];
            $Customer->save();
            $data['cust_id'] = $Customer->id;

        } else {
            $Customer = new Customer();
            $Customer = $Customer->where('id', $data['cust_id'])->first();
            checkaddress:

            if ($Customer->contact_no != $data['cust_phone'] || $Customer->address != $data['cust_address'] || $Customer->loc_lat != $data['loc_lng'] || $Customer->loc_lng != $data['loc_lng']) {
                $is_new_address = true;
            }
        }

        if ($Customer->contact_no != $data['cust_phone'] || $Customer->address != $data['cust_address'] || $Customer->loc_lat != $data['loc_lng'] || $Customer->loc_lng != $data['loc_lng']) {
            $is_new_address = true;
        }

        $task->cust_id        = $Customer->id;
        $task->type           = $data['type'];
        $task->notes          = $data['notes'];
        $task->method         = $data['method'];
        $task->is_new_address = $is_new_address;

        if ($is_new_address) {
            $task->cust_phone   = $data['cust_phone'];
            $task->loc_lat      = $data['loc_lat'];
            $task->loc_lng      = $data['loc_lng'];
            $task->cust_address = $data['cust_address'];
        } else {
            $task->cust_phone   = $Customer->contact_no;
            $task->loc_lat      = $Customer->loc_lat;
            $task->loc_lng      = $Customer->loc_lng;
            $task->cust_address = $Customer->address;
        }

        if ((isset($data['is_geo_fence'])) && ($data['is_geo_fence'] == 1)) {
            if (isset($data['geo_fence_meter'])) {
                $task->geo_fence_meter = $data['geo_fence_meter'];
                $task->is_geo_fence    = $data['is_geo_fence'];
            } else {
                return Base::touser('Geo Fence Meter Required');
            }

        } else {
            $task->geo_fence_meter = null;
            $task->is_geo_fence    = 0;

        }

        $task->save();
        $emp_id = isset($data['emp']) ? $data['emp'] : $this->emp_id;
        $status = isset($data['status']) ? $data['status'] : 'Unallocated';

        $task_status = ScheduleTaskStatus::where('task_id', $task->id)->orderBy('created_at', 'desc')->first();

        if (!empty($task_status)) {

            if ($task_status->emp_id == $emp_id && $task_status->status == $status) {
                // so update
            } else {
                $task_status = new ScheduleTaskStatus();
            }
        } else {
            $task_status = new ScheduleTaskStatus();
        }

        $task_status->emp_id     = $emp_id;
        $task_status->task_id    = $task->id;
        $task_status->address    = '';
        $task_status->lat        = '';
        $task_status->long       = '';
        $task_status->status     = $status;
        $task_status->timestamps = isset($data['timestamps']) ? Base::tomysqldatetime($data['timestamps']) : date("Y-m-d H:i:s");
        $task_status->save();

        if (($data['status'] != 'Unallocated') && ($data['status'] != 'Canceled')) {
            if (empty($data['emp'])) {
                return Base::touser('Employee Required');
            }

            $allocation = allocation::where('task_id', $task->id)->first();
            if (count($allocation) < 1) {
                $allocation = new allocation();

            }
            $allocation->emp     = $data['emp'];
            $allocation->add_by  = isset($data['added_by']) ? $data['added_by'] : $this->emp_id;
            $allocation->task_id = $task->id;
            $allocation->save();

            $user = \App\Models\User::find($allocation->emp);
            $user->notify(new \App\Notifications\TaskUpdated($task, $user));
            //  $cust = \App\Models\Customer::find($task->cust_id )->notify(new \App\Notifications\CustomerTracking($task, $user, Base::get_domin(),true));
        } else {
            $allocation = allocation::where('task_id', $task->id)->delete();
        }

        return Base::touser('Task Updated', true);
    }

    public function destroy($id)
    {
        emp_cust::where('emp_cust_id', '=', $id)
            ->delete();

        $api = task::find($id);
        $api->delete();
        return Base::touser('Task Deleted', true);
    }
}
