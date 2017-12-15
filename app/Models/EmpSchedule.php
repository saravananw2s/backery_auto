<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

use OwenIt\Auditing\Auditable;
use OwenIt\Auditing\Contracts\Auditable as AuditableContract;

/**
 * Class EmpSchedule
 */
class EmpSchedule extends Model implements AuditableContract
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





    public function emp_info()
    {
        return $this->belongsTo('App\Models\User', 'emp','user_id');
    }

    public function task()
    {
        return $this->belongsTo('App\Models\EmpCustSchedule', 'task_id','id');
    }


    protected $table = 'emp_schedule';

    public $timestamps = true;

    protected $fillable = [
        'emp',
        'add_by',
        'task_id',
    ];

    protected $hidden = ['method','date'];
}
