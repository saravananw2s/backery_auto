<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;


use OwenIt\Auditing\Auditable;
use OwenIt\Auditing\Contracts\Auditable as AuditableContract;

/**
 * Class MarketIntelligence
 */
class MarketIntelligence extends Model implements AuditableContract
{
    use Auditable;


    protected $table = 'market_intelligence';

    public $timestamps = true;

    public function market_info()
    {
        return $this->hasMany('App\Models\Market', 'market_id', 'id');
    }



    protected $fillable = [
        'uploads',
        'desc',
        'location',
        'loc_lat',
        'loc_lng',
        'taken_by',
        'date',
        'is_approved'
    ];

    protected $guarded = [];
}
