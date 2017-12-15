<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use OwenIt\Auditing\Auditable;
use OwenIt\Auditing\Contracts\Auditable as AuditableContract;

/**
 * Class Activity
 */
class Activity extends Model implements AuditableContract
{
    use Auditable;


    protected $table = 'activities';

    public $timestamps = true;

    protected $fillable = [
        'name',
        'desc'
    ];

    protected $guarded = [];
}
