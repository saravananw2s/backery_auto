<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

use OwenIt\Auditing\Auditable;
use OwenIt\Auditing\Contracts\Auditable as AuditableContract;

/**
 * Class Market
 */
class Market extends Model implements AuditableContract
{
    use Auditable;
    protected $table = 'market';

    public $timestamps = false;

    protected $fillable = [
        'comp_id',
        'comp_activity_id',
        'comp_remark',
        'market_id'
    ];



    protected $guarded = [];
}
