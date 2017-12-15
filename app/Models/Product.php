<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

use OwenIt\Auditing\Auditable;
use OwenIt\Auditing\Contracts\Auditable as AuditableContract;

class Product extends Model implements AuditableContract
{
    use Auditable;


     public function category_info()
    {
        return $this->hasOne('App\Models\Category', 'id', 'category');
    }


    protected $table = 'products';

    protected $primaryKey = 'product_id';

    protected $dates = ['deleted_at'];

    public $timestamps = true;

    protected $fillable = [
        'name',
        'price',
        'unit',
        'quantity',
        'desc',
        'photos',
        'doc_info',
        'category'
    ];

    protected $guarded = [];
}
