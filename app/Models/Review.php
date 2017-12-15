<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use OwenIt\Auditing\Auditable;
use OwenIt\Auditing\Contracts\Auditable as AuditableContract;

/**
 * Class Review
 */
class Review extends Model implements AuditableContract
{
    use Auditable;

        public function cust()
    {

        return $this->belongsTo('App\Models\Customer', 'cust_id', 'id')->select(['id', 'name','loc_lat','loc_lng','address']);
    }

        public function emp_info()
    {
        return $this->belongsTo('App\Models\User', 'emp_id','user_id');
    }



    protected $table = 'reviews';
    public $incrementing = true;
    public $timestamps = true;

    // protected $fillable = [
    //     'name',
    //     'desc'
    // ];

    // protected $guarded = [];
}
