<?php

namespace App\Models;
use Illuminate\Database\Eloquent\Model;
use OwenIt\Auditing\Auditable;
use OwenIt\Auditing\Contracts\Auditable as AuditableContract;

/**
 * Class OrderBooking
 */
class OrderBooking extends Model implements AuditableContract
{
    use Auditable;


    public function takenby()
    {
        return $this->hasOne('App\Models\User', 'user_id', 'emp_id');
    }


    public function customer()
    {
        return $this->hasOne('App\Models\Customer', 'id', 'cust_id');
    }
    public function product_info()
    {
        return $this->hasMany('App\Models\ProductOrder', 'order_id', 'order_booking_id');
    }

    protected $table = 'order_bookings';

    protected $primaryKey = 'order_booking_id';

    public $timestamps = false;

    protected $fillable = [
        'cust_id',
        'quote_ref',
        'po_num',
        'po_date',
        'ship_to',
        'bil_to',
        'remarks',
        'files_info',
        'emp_id',
        'order_date',
        'status'
    ];

    protected $guarded = [];
}
