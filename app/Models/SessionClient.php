<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class SessionClient extends Model
{
    protected $table = 'session_clients';

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
        'client_ip',
        'client_data',
        'client_info'
    ];

    protected $guarded = [];
}
