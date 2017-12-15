<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;


use OwenIt\Auditing\Auditable;
use OwenIt\Auditing\Contracts\Auditable as AuditableContract;

class Requests extends Model implements AuditableContract
{
    use Auditable;


    public function request_info()
    {
        return $this->hasMany('App\Models\RequestInfo', 'request_id', 'id');
    }



    protected $table = 'requests';

    public $timestamps = true;

    protected $fillable = [
        'desc',
        'date',
        'cust_id',
        'uploads',
        'status',
        'taken_by'
    ];

    protected $guarded = [];
}
