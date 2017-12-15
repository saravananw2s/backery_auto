<?php
namespace App\Http\Controllers;

use App\Models\EmpSchedule as allocation;
use App\Models\TravelHistory as api;
use Illuminate\Http\Request;
use Validator;
use Toin0u\Geotools\Facade\Geotools;
class LocationApi extends Controller
{
    public function store(Request $request)
    {
        $rules = [
            'lat'               => 'required',
            'lng'               => 'required',
            'timestamp'         => 'required',
            'compass_direction' => 'required',
        ];

        $data      = $request->input('data');
        $validator = Validator::make($data, $rules);

        if ($validator->fails()) {
            return Base::touser($validator->errors()->all()[0]);
        }

        $ch = false;

        if (($data['activity'] == 'Start') || ($data['activity'] == 'Stop')) {

            $last = api::where('user_id', $this->emp_id)
                ->get()->last();

            if ($last) {

                if ($last->activity == 'Monitor') {
                    $ch             = true;
                    $last->activity = "Stop";
                    $last->save();
                }

                if ($last->activity == 'Start') {

                    $api                    = new api;
                    $api->user_id           = $this->emp_id;
                    $api->accuracy          = $last->accuracy;
                    $api->speed             = $last->speed;
                    $api->bearing           = $last->bearing;
                    $api->lng               = $last->lng;
                    $api->lat               = $last->lat;
                    $api->compass_direction = $last->compass_direction;
                    $api->timestamp         = $last->timestamp;
                    $api->activity          = 'Stop';
                    $api->save();
                }
            }

        }

        $last = api::where('user_id', $this->emp_id)
            ->get()->last();

        $insert = false;
        if ($last) {
            if ($last->activity == 'Stop' && ($data['activity'] == 'Monitor' || $data['activity'] == 'Stop') && ($ch == false)) {
                $insert = true;
            }
        } else {
            if ($data['activity'] == 'Monitor' || $data['activity'] == 'Stop') {

                $insert = true;

            }

        }

        self::GPSDataClean();
        if ($insert == false) {
            $api                    = new api;
            $api->user_id           = $this->emp_id;
            $api->accuracy          = isset($data['accuracy']) ? $data['accuracy'] : null;
            $api->speed             = isset($data['speed']) ? $data['speed'] : null;
            $api->bearing           = isset($data['bearing']) ? $data['bearing'] : null;
            $api->compass_direction = $data['compass_direction'];
            $api->lng               = $data['lng'];
            $api->lat               = $data['lat'];
            $api->battery_status    = isset($data['battery_status']) ? $data['battery_status'] : null;

            $api->timestamp = Base::tomysqldatetime($data['timestamp']);
            $api->activity  = isset($data['activity']) ? $data['activity'] : null;

            $api->save();

            event(new \App\Events\LocationUpdate($api, $this->emp_id));

        }
        return Base::touser([], true);
    }

    public function GPSDataClean()
    {

        // to clear the start and stop with out monitoring
        $checkold = api::where('user_id', $this->emp_id)
            ->orderBy('id', 'desc')
            ->take(2)->get();

        $st = false;
        if (count($checkold) == 2) {

            if ($checkold[0]['activity'] == 'Stop' && $checkold[1]['activity'] == 'Start') {
                $checkold = api::where('user_id', $this->emp_id)
                    ->orderBy('id', 'desc')
                    ->where('activity', '<>', 'Monitor')
                    ->take(2)->delete();
                $st = true;
            }
        }

        if ($st) {
            self::GPSDataClean();
        }

        return;

    }

    public function TravelClear()
    {
        \App\Models\TravelHistory::where('user_id', $this->emp_id)->delete();

        return 'User Travel Cleared :)';
    }

    public function get($id)
    {
        $array = api::orderBy('timestamp', 'desc')->with('user')->where('user_id', '=', $id)->first();

        $array['timestamp'] = Base::time_elapsed_string($array['timestamp']);

        return Base::touser($array, true);
    }

    public function locationbulk(Request $request)
    {

        $data = $request->input('data');

        foreach ($data as $key => $value) {
            $api                 = new api;
            $api->user_id        = $this->emp_id;
            $api->accuracy       = isset($data[$key]['accuracy']) ? $data[$key]['accuracy'] : null;
            $api->speed          = isset($data[$key]['speed']) ? $data[$key]['speed'] : null;
            $api->bearing        = isset($data[$key]['bearing']) ? $data[$key]['bearing'] : null;
            $api->battery_status = isset($data[$key]['battery_status']) ? $data[$key]['battery_status'] : null;
            $api->lng            = $data[$key]['lng'];
            $api->lat            = $data[$key]['lat'];
            $api->timestamp      = Base::tomysqldatetime($data[$key]['timestamp']);
            $api->activity       = isset($data[$key]['activity']) ? $data[$key]['activity'] : null;
            $api->save();

        }

        self::GPSDataClean();
        return Base::touser([], true);
    }

    public function emp_getonline(Request $request)
    {
        $array = [];

        if ($this->manager) {

            $belongsemp = Base::getEmpBelongsUser($this->emp_id);

            $array = api::with('user')
                ->whereIn('user_id', $belongsemp)
                ->orderBy('timestamp', 'desc')
                ->get()
                ->unique('user_id');
        } else {
            $array = api::with('user')->orderBy('timestamp', 'desc')->get()->unique('user_id');
        }

        return Base::touser($array, true);
    }

    public function emp_filter(Request $request)
    {
        $data = $request->input('data');

        if ((null !== $data['start_date']) && (null !== $data['end_date'])) {

            $Allocated   = [];
            $InProgress  = [];
            $Incomplete  = [];
            $Delivered   = [];
            $Canceled    = [];
            $Unallocated = [];
            $dataBag     = [];

            $start      = Base::tomysqldate($data['start_date']);
            $end        = Base::tomysqldate($data['end_date']);
            $start_time = Base::tomysqldate($data['start_date']) . ' 00:00:0';
            $end_time   = Base::tomysqldate($data['end_date']) . ' 23:59:00';

            if ($data['emp_id'] == 'all') {

                if ($this->manager) {

                    $belongsemp = Base::getEmpBelongsUser($this->emp_id);

                    $tasks = allocation::whereIn('emp', $belongsemp)
                        ->wherehas('task', function ($q) use ($start, $end) {
                            $q->where(\DB::raw("date(schedule_date_time)"), '<=', $end)->
                                where(\DB::raw("date(schedule_date_time)"), '>=', $start);
                        })
                        ->with('task')->get();

                } else {

                    $tasks = allocation::wherehas('task', function ($q) use ($start, $end) {
                        $q->where(\DB::raw("date(schedule_date_time)"), '<=', $end)->
                            where(\DB::raw("date(schedule_date_time)"), '>=', $start);
                    })
                    ->with('task')->get();
                }

                $user = [];
            } else {

                $tasks = allocation::where('emp', $data['emp_id'])
                    ->wherehas('task', function ($q) use ($start, $end) {
                        $q->where(\DB::raw("date(schedule_date_time)"), '<=', $end)->
                            where(\DB::raw("date(schedule_date_time)"), '>=', $start);
                    })
                    ->with('task')->get();

            }


                $geo = api::orderBy('timestamp', 'asc')
                ->where('user_id', '=',  $data['emp_id'])
                ->where('timestamp', '<=', $end_time)
                ->where('timestamp', '>=', $start_time)
                ->get(["id", "lat", "lng", "activity", "timestamp", "battery_status"])->toArray();


            foreach ($tasks as $key => $data) {

                if ($data['task']['status'] == "Allocated") {
                    $Allocated[] = $data;
                } elseif ($data['task']['status'] == "In-Progress") {
                    $InProgress[] = $data;
                } elseif ($data['task']['status'] == "Incomplete") {
                    $Incomplete[] = $data;
                } elseif ($data['task']['status'] == "Delivered") {
                    $Delivered[] = $data;
                } elseif ($data['task']['status'] == "Canceled") {
                    $Canceled[] = $data;
                } elseif ($data['task']['status'] == "Unallocated") {
                    $Unallocated[] = $data;
                } else {

                }

            }




            $dataBag =  array_merge($Allocated,
$InProgress,
$Incomplete,
$Delivered,
$Canceled,
$Unallocated);
            $data                          = [];
            $data['visits']['total']       = count($dataBag);
            $data['visits']['allocated']   = count($Allocated);
            $data['visits']['in-progress'] = count($InProgress);
            $data['visits']['incomplete']  = count($Incomplete);
            $data['visits']['canceled']    = count($Canceled);
            $data['visits']['unallocated'] = count($Unallocated);
            $data['visits']['delivered']   = count($Delivered);
            $data['visit_list']            = $dataBag;

            $data['geo']            = isset($geo) ? $geo : [];
            return Base::touser($data, true);

        } else {
            Base::touser([], false);
        }
    }

    public function current_emp_filter(Request $request)
    {

        if($request->input('date'))
        {

             $data = $request->input('date');
        $start = Base::tomysqldate($data) . ' 00:00:00';
        $end   = Base::tomysqldate($data) . ' 23:59:00';
     }
        elseif($request->input('start') && $request->input('end'))
        {

             $start = $request->input('start');
             $end = $request->input('end');
        $start = Base::tomysqldate($start) . ' 00:00:00';
        $end   = Base::tomysqldate($end) . ' 23:59:00';
        }
        else
        {
           return Base::touser('Invalid Parameters');
        }


        if ((null !== $start) && (null !== $end)) {

            $start = Base::tomysqldatetime($start);
            $end   = Base::tomysqldatetime($end);


            if($request->input('emp'))
            {
                $emp = $request->input('emp');
            }
            else
            {
                $emp = $this->emp_id;
            }

               $distInMeter = 0;

            $array = api::orderBy('timestamp', 'asc')->
                where('user_id', $emp)->
                where('timestamp', '<=', $end)->
                where('timestamp', '>=', $start)
                ->get(["id", "lat", "lng", "activity", "timestamp", "battery_status"])->toArray();



                         $distance = [];
                        $distance[] = 0;
                        for ($x = 0; $x < count($array) - 1; $x++) {



                        if( ($array[$x]['activity'] == 'Start'))
                        {
                            $distance[] =  $distance[count( $distance)-1];
                            $distance[] = 0;
                        }
                        else
                        {
                        $data1                   = $array[$x];
                        $data2                   = $array[$x + 1];
                        $array[$x]['path']     = [$data1['lat'], $data1['lng']];
                        $array[$x + 1]['path'] = [$data2['lat'], $data2['lng']];
                        $coordA                  = Geotools::coordinate($array[$x]['path']);
                        $coordB                  = Geotools::coordinate($array[$x + 1]['path']);
                        $dist                = Geotools::distance()->setFrom($coordA)->setTo($coordB);
//                       $distance  = round($dist->in('km')->haversine(), 2) + $distance;

                        $distance[count( $distance)-1]  = round($dist->in('km')->haversine(), 2) + $distance[count( $distance)-1];


                        }




                     }


                    $distance = array_sum($distance);


                $start = false;
                $end = false;
                           $time_taken = 'No Data';
                if(count($array) > 1)
                {
                if($array[0]['timestamp'])
                {
                                $start = $array[0]['timestamp'];
                }

               if($array[count($array)-1]['timestamp'])
                {
                              $end = $array[count($array)-1]['timestamp'];
                }


                if( ($start) && ($end))
                {


                     $time_taken = Base::time_elapsed_string($end, true, $start);

                     if (empty($time_taken)) {
                         $time_taken = '1 min';
                     }
                }
                }

                $data = [];
                $data['geoData'] = $array;
                $data['distance'] =  round($distance,2). ' Kms';
                $data['time_taken'] = $time_taken;



            return Base::touser($data, true);
        }
    }

    public function emp(Request $request, $id)
    {
        $array = [];

        $array = api::orderBy('timestamp', 'desc')->with('user')->where('user_id', '=', $id)->get()->toArray();

        foreach ($array as $i => $value) {
            $array[$i]['timestamp'] = Base::time_elapsed_string($array[$i]['timestamp']);

            $array[$i]['user']['profile_image'] = (Array) json_decode(stripslashes($array[$i]['user']['profile_image']));
        }

        return Base::touser($array, true);
    }
}
