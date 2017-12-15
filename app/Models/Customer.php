<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

use OwenIt\Auditing\Auditable;
use OwenIt\Auditing\Contracts\Auditable as AuditableContract;
use Illuminate\Notifications\Notifiable;
/**
 * Class Customer
 */
class Customer extends Model implements AuditableContract
{
    use Auditable,Notifiable;


    public function emp()
    {
        return $this->belongsTo('App\Models\User', 'emp_id', 'user_id');
    }

    public function scopedistance($query, $from_latitude, $from_longitude, $distance)
    {
        // This will calculate the distance in km
        // if you want in miles use 3959 instead of 6371
        $raw = \DB::raw('ROUND ( ( 6371 * acos( cos( radians('.$from_latitude.') ) * cos( radians( loc_lat ) ) * cos( radians( loc_lng ) - radians('.$from_longitude.') ) + sin( radians('.$from_latitude.') ) * sin( radians( loc_lat ) ) ) ) ) AS distance');
        return $query->select('*')->addSelect($raw)->orderBy('distance', 'ASC')->groupBy('distance')->having('distance', '<=', $distance);
    }

    /**
        * Display timestamps in user's timezone
        */
       protected function asDateTime($value)
       {

           $value = \App\Http\Controllers\Base::ConvertTimezone($value);

           return $value;

       }


    protected $table = 'customers';

    public $timestamps = true;

    protected $fillable = [
        'name',
        'address',
        'city',
        'state',
        'country',
        'zipcode',
        'loc_lat',
        'loc_lng',
        'contact_person',
        'contact_no',
        'pan',
        'tin',
        'type',
        'email',
        'desc',
        'district',
        'uploads',
        'emp_id'
    ];

    protected $guarded = [];
}
