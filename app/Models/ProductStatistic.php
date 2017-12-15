<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;


use OwenIt\Auditing\Auditable;
use OwenIt\Auditing\Contracts\Auditable as AuditableContract;

/**
 * Class ProductStatistic
 */
class ProductStatistic extends Model implements AuditableContract
{
    use Auditable;

    public function cust()
    {
        return $this->belongsTo('App\Models\Customer', 'id', 'cust_id');
    }

    public function prod()
    {
        return $this->belongsTo('App\Models\Product', 'prod_id', 'product_id');
    }


    protected $table = 'product_statistics';

    public $timestamps = false;

    protected $fillable = [
        'prod_id',
        'cust_id',
        'pdt_grade',
        'target',
        'actuals',
        'year',
        'month'
    ];

    protected $guarded = [];
}
