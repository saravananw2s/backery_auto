<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use OwenIt\Auditing\Auditable;
use OwenIt\Auditing\Contracts\Auditable as AuditableContract;

/**
 * Class Notifications
 */
class Notifications extends Model implements AuditableContract
{
    use Auditable;

         /**
     * Display timestamps in user's timezone
     */
    protected function asDateTime($value)
    {

        $value = \App\Http\Controllers\Base::ConvertTimezone($value);

        return $value;

    }
    protected $table = 'notifications';
    public $incrementing = false;
    // public $timestamps = true;

    // protected $fillable = [
    //     'name',
    //     'desc'
    // ];

    // protected $guarded = [];
}
