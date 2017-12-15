<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use OwenIt\Auditing\Auditable;
use OwenIt\Auditing\Contracts\Auditable as AuditableContract;

/**
 * Class TravelExp
 */
class TravelExpHotel extends Model implements AuditableContract
{
    use Auditable;

    protected $table = 'travel_exp_hotel';

    public $timestamps = true;

    protected $fillable = [
        'travel_report_id',
        'check_in',
        'check_out',
        'total_exp',
        'hotel_info',
        'desc',
    ];

    protected $guarded = [];
}
