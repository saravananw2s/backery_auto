<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

use OwenIt\Auditing\Auditable;
use OwenIt\Auditing\Contracts\Auditable as AuditableContract;

/**
 * Class Category
 */
class Category extends Model implements AuditableContract
{
    use Auditable;




    protected $table = 'category';

    protected $dates = ['deleted_at'];


    public $timestamps = true;

    protected $fillable = [
        'name',
        'desc'
    ];

    protected $guarded = [];
}
