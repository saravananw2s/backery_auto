<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

use OwenIt\Auditing\Auditable;
use OwenIt\Auditing\Contracts\Auditable as AuditableContract;

/**
 * Class CustomerStatistic
 */

class CustomerStatistic extends Model implements AuditableContract
{
    use Auditable;

    public function cust()
    {
        return $this->belongsTo('App\Models\Customer', 'cust_id', 'id')->select(['id', 'name']);
    }

    public function prod_stat()
    {
        return $this->hasMany('App\Models\ProductStatistic', 'cust_id', 'cust_id');
    }



    protected $table = 'customer_statistics';

    public $timestamps = true;

    protected $dates = [
        'created_at',
        'updated_at',
        'deleted_at'
    ];

    protected $fillable = [
        'cust_id',
        'year',
        'month',
        'credit_limit',
        'credit_terms',
        'outstandings',
        'last_visited',
        'over_due'
    ];

    protected $guarded = [];
}
