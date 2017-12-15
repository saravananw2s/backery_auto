<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use OwenIt\Auditing\Auditable;
use OwenIt\Auditing\Contracts\Auditable as AuditableContract;

/**
 * Class ScheduleTaskStatus
 */
class ScheduleTaskStatus extends Model implements AuditableContract
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

    public function getTimestampsAttribute($value)
    {

        $value = \App\Http\Controllers\Base::ConvertTimezone($value, true);

        return $value;

    }

    protected $table = 'task_status';

    public $timestamps = true;

    protected $fillable = [
        'timestamps',
        'task_id',
        'emp_id',
        'address',
        'lat',
        'long'];

    protected $guarded = [];
}
