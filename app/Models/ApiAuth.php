<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

use OwenIt\Auditing\Auditable;
use OwenIt\Auditing\Contracts\Auditable as AuditableContract;

/**
 * Class ApiAuth
 */

class ApiAuth extends Model implements AuditableContract
{
    use Auditable;
    protected $table = 'api_auth';

    /**
        * Display timestamps in user's timezone
        */
       protected function asDateTime($value)
       {

           $value = \App\Http\Controllers\Base::ConvertTimezone($value);

           return $value;

       }


    protected $primaryKey = 'auth_id';

    public $timestamps = true;

    protected $fillable = [
        'auth_key',
        'auth_user_agent',
        'auth_user_id',
        'auth_ip',
        'auth_model',
        'is_active',
        'device_token',
        'device_type'
    ];

    protected $guarded = [];
}
