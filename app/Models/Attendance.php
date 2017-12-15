<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

use OwenIt\Auditing\Auditable;
use OwenIt\Auditing\Contracts\Auditable as AuditableContract;

/**
 * Class Attendance
 */
class Attendance extends Model implements AuditableContract
{
    use Auditable;

    public function role()
    {
        return $this->hasOne('App\Models\User', 'user_id', 'user_id');
    }


    protected $table = 'attendance';


    public $timestamps = false;


    protected $fillable = [
        'user_id',
        'in_time',
        'out_time',
        'attent_type',
        'leave_desc',
        'login_lat',
        'login_lon',
        'logout_lat',
        'logout_lon'
    ];

    protected $guarded = [];
}
