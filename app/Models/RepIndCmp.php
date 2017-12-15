<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

use OwenIt\Auditing\Auditable;
use OwenIt\Auditing\Contracts\Auditable as AuditableContract;

/**
 * Class RepIndCmp
 */
class RepIndCmp extends Model implements AuditableContract
{
    use Auditable;
    protected $table = 'rep_ind_cmp';

    public $timestamps = false;

    protected $fillable = [
        'comp_name',
        'comp.product',
        'comp_rsp',
        'comp_wsp',
        'comp_stk',
        'visit_report_id'
    ];

    protected $guarded = [];
}
