<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use OwenIt\Auditing\Auditable;
use OwenIt\Auditing\Contracts\Auditable as AuditableContract;

/**
 * Class TravelExp
 */
class TravelExpReport extends Model implements AuditableContract
{
    use Auditable;

    public function user()
    {
        return $this->belongsTo('App\Models\User', 'user_id', 'user_id');
    }

    public function hotel_exp()
    {
        return $this->hasMany('App\Models\TravelExpHotel', 'travel_report_id', 'id');
    }

    public function travel_exp()
    {
        return $this->hasMany('App\Models\TravelExp', 'travel_report_id', 'id');
    }




    protected $table = 'travel_exp_report';

    public $timestamps = true;

    protected $fillable = [
        'start_date',
        'end_date',
        'type',
        'claim_id',
        'purpose',
        'appr_status',
        'location',
        'food_exp',
        'out_pdt',
        'travel_with_mngr',
        'total_exp',
        'travel_by',
        'extra_exp',
        'travel_desc',
        'user_id',
        'uploads',
    ];

    protected $guarded = [];
}
