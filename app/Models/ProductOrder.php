<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

use OwenIt\Auditing\Auditable;
use OwenIt\Auditing\Contracts\Auditable as AuditableContract;

/**
 * Class ProductOrder
 */
class ProductOrder extends Model implements AuditableContract
{
    use Auditable;

    public function product()
    {
        return $this->hasOne('App\Models\Product', 'product_id', 'product_id');
    }

    protected $table = 'product_orders';

    public $timestamps = false;

    protected $fillable = [
        'product_id',
        'pro_quantity',
        'pro_req_date',
        'order_id',
        'pro_price'
    ];

    protected $guarded = [];
}
