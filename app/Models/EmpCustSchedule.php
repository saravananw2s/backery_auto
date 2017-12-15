<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;


use OwenIt\Auditing\Auditable;
use OwenIt\Auditing\Contracts\Auditable as AuditableContract;
use App\Models\ScheduleTaskStatus;
class EmpCustSchedule extends Model implements AuditableContract
{
    use Auditable;

    protected $table = 'emp_cust_schedule';

    public $timestamps = true;

    public function cust()
    {

        return $this->belongsTo('App\Models\Customer', 'cust_id', 'id')->select(['id', 'name','loc_lat','loc_lng','address']);
    }

    // public function allocated_emp()
    // {
    //     return $this->belongsTo('App\Models\EmpSchedule', 'id','task_id');
    // }

    public function all_status()
    {
        return $this->hasMany('App\Models\ScheduleTaskStatus','task_id', 'id');
    }


    /**
        * Display timestamps in user's timezone
        */
       protected function asDateTime($value)
       {

           $value = \App\Http\Controllers\Base::ConvertTimezone($value);

           return $value;

       }


    public function getAllocatedEmpAttribute() {

        $data = \App\Models\EmpSchedule::where('task_id',$this->id)->with('emp_info')->first();

        if(count($data))
        {

            return $data->emp_info->first_name.' '.$data->emp_info->last_name;
        }

        return null;

    }

        public function getAllocatedEmpIdAttribute() {

        $data = \App\Models\EmpSchedule::where('task_id',$this->id)->with('emp_info')->first();

        if(count($data))
        {

            return $data->emp_info->user_id;
        }

        return null;

    }
        public function getCustNameAttribute() {


            if(!empty($this->contact_person))
            {
                return $this->contact_person;
            }

        $data =  \App\Models\Customer::where('id', $this->cust_id)->first();
        if($data)
        {

            return $data->name;
        }

        return null;

    }


    public function getStatusAttribute() {

        $data = ScheduleTaskStatus::where('task_id',$this->id)->get()->last();

        if($data)
        {

            return $data->status;
        }

        return 'Unallocated';

    }
        public function getTimestampsAttribute() {



        return $this->delivery_time;

    }


     public function getScheduleDateTimeAttribute($value) {

        $value = \App\Http\Controllers\Base::ConvertTimezone($value,true);

           return $value;

    }


     public function getDeliveryTimeAttribute($value) {

        $value = \App\Http\Controllers\Base::ConvertTimezone($value,true);

           return $value;

    }


    protected $appends = ['status','cust_name','allocated_emp','allocated_emp_id'];
    protected $fillable = [
        'cust_id',
        'date',
        'type',
        'notes',
        'lat',
        'lng',
        'delivery_to',
        'delivery_phone',
        'is_cust_delivery',
        'remarks',
        'delivery_time'
        ,'added_by'
        ,'item_tracking_url'
        ,'cust_phone'
        ,'signature'
        ,'images'
        ,'items'
        ,'schedule_date_time'
        //new api
        ,'is_new_address'
        ,'cust_address'
        ,'loc_lng'
        ,'loc_lat'
        ,'method'
        ,'is_geo_fence'
        ,'geo_fence_meter'
        ,'contact_person'
    ];
     protected $primaryKey = 'id';
    protected $hidden = [
"emp_id",
"item_tracking_url",
"images",
"items",
"date",
"phone",
'emp_id',
"emp_cust_schedulecol",
];
}
