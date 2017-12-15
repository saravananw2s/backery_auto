<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;


use OwenIt\Auditing\Auditable;
use OwenIt\Auditing\Contracts\Auditable as AuditableContract;

class RequestInfo extends Model implements AuditableContract
{
    use Auditable;


    protected $table = 'requests_info';

    public $timestamps = true;


    protected $fillable = [
        'desc',
        'type',
        'request_id',
    ];

    protected $guarded = [];
}
