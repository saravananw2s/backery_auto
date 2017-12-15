<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

use OwenIt\Auditing\Auditable;
use OwenIt\Auditing\Contracts\Auditable as AuditableContract;

class ProspectType extends Model implements AuditableContract
{
    use Auditable;

   // SoftDeletes protected $softDelete = true;



    protected $table = 'prospect_types';

    protected $dates = ['deleted_at'];


    public $timestamps = true;

    protected $fillable = [
        'name',
        'desc'
    ];

    protected $guarded = [];
}
