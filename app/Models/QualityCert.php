<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

use OwenIt\Auditing\Auditable;
use OwenIt\Auditing\Contracts\Auditable as AuditableContract;

/**
 * Class QualityCert
 */
class QualityCert extends Model implements AuditableContract
{
    use Auditable;
    protected $table = 'quality_cert';

    protected $primaryKey = 'cert_id';

    public $timestamps = false;

    protected $fillable = [
        'comp_id',
        'prod_id',
        'bath_id',
        'year',
        'month',
        'week_no'
    ];

    protected $guarded = [];
}
