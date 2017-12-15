<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

use OwenIt\Auditing\Auditable;
use OwenIt\Auditing\Contracts\Auditable as AuditableContract;

/**
 * Class Location
 */
class Location extends Model implements AuditableContract
{
    use Auditable;
    protected $table = 'locations';

    public $timestamps = false;


    protected $fillable = [
        'name',
        'lat',
        'lng',
        'created_on'
    ];

    protected $guarded = [];
}
