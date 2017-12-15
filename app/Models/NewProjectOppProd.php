<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;


use OwenIt\Auditing\Auditable;
use OwenIt\Auditing\Contracts\Auditable as AuditableContract;

/**
 * Class NewProjectOpp
 */
class NewProjectOppProd extends Model implements AuditableContract
{
    use Auditable;

    public function products()
    {
        return $this->hasone('App\Models\Products', 'product_id', 'product_id');
    }



    protected $table = 'new_project_products';

    public $timestamps = true;




    protected $fillable = [
        'new_project_opp_id',
        'product_id',
        'quantity',
        'desc',
    ];

    protected $guarded = [];
}
