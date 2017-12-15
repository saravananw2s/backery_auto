<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

use OwenIt\Auditing\Auditable;
use OwenIt\Auditing\Contracts\Auditable as AuditableContract;

class Competitor extends Model implements AuditableContract
{
    use Auditable;


    protected $table = 'competitor';

    public $timestamps = true;

    /**
        * Display timestamps in user's timezone
        */
       protected function asDateTime($value)
       {

           $value = \App\Http\Controllers\Base::ConvertTimezone($value);

           return $value;

       }


    protected $fillable = [
        'name',
        'desc',
        'remark',
        'address',
        'loc_lat',
        'loc_lng',
        'uploads',
    ];

    protected $guarded = [];
}
