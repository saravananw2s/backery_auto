<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

use OwenIt\Auditing\Auditable;
use OwenIt\Auditing\Contracts\Auditable as AuditableContract;

/**
 * Class OneTimePwd
 */
class OneTimePwd extends Model implements AuditableContract
{
    use Auditable;
    protected $table = 'one_time_pwd';

    public $timestamps = false;

    protected $fillable = [
        'pwd',
        'userid',
        'created_on',
        'status',
        'valid_until'
    ];

    protected $guarded = [];
}
