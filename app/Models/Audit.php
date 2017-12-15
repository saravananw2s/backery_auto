<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

/**
 * Class Audit
 */
class Audit extends Model
{

    /**
        * Display timestamps in user's timezone
        */
       protected function asDateTime($value)
       {

           $value = \App\Http\Controllers\Base::ConvertTimezone($value);

           return $value;

       }

    protected $table = 'audits';

    public $timestamps = true;

    protected $fillable = [
        'auditable_id',
        'auditable_type',
        'old_values',
        'new_values',
        'user_id',
        'url',
        'ip_address',
        'event'
    ];

    protected $guarded = [];
}
