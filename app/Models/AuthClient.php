<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

/**
 * Class AuthClient
 */
class AuthClient extends Model
{
    protected $table = 'auth_clients';

    /**
        * Display timestamps in user's timezone
        */
       protected function asDateTime($value)
       {

           $value = \App\Http\Controllers\Base::ConvertTimezone($value);

           return $value;

       }


    protected $primaryKey = 'client_id';

    public $timestamps = true;

    protected $fillable = [
        'client_x_data',
        'auth_id'
    ];

    protected $guarded = [];
}
