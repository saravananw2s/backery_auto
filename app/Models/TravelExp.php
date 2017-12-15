<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use OwenIt\Auditing\Auditable;
use OwenIt\Auditing\Contracts\Auditable as AuditableContract;

/**
 * Class TravelExp
 */
class TravelExp extends Model implements AuditableContract
{
    use Auditable;

    protected $table = 'travel_exp';

    public $timestamps = true;


    protected $fillable = [
        'travel_report_id',
        'mode',
        'start',
        'end',
        'total_exp',
        'total_kms',
        'desc',
    ];

    protected $guarded = [];
}
