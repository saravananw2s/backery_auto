<?php
namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class TravelHistory extends Model
{
    protected $table = 'travel_history';

    public $timestamps = true;

    public function user()
    {
        return $this->belongsTo('App\Models\User', 'user_id', 'user_id');
    }

         /**
     * Display timestamps in user's timezone
     */
    protected function asDateTime($value)
    {

        $value = \App\Http\Controllers\Base::ConvertTimezone($value);

        return $value;

    }


    public function getTimestampAttribute($value)
      {

     $value = \App\Http\Controllers\Base::ConvertTimezone($value,true);
          return $value;

      }


    protected $fillable = [
        'user_id',
        'accuracy',
        'speed',
        'bearing',
        'lat',
        'lng',
        'battery_status',
        'activity',
        'timestamp',
        'compass_direction'
    ];

    protected $guarded = [];
}
