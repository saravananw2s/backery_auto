<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

use OwenIt\Auditing\Auditable;
use OwenIt\Auditing\Contracts\Auditable as AuditableContract;

class VisitReport extends Model implements AuditableContract
{
    use Auditable;

    public function Customer()
    {
        return $this->hasOne('App\Models\Customer', 'id', 'cust_id');
    }

    public function rep_cmp()
    {
        return $this->hasMany('App\Models\RepIndCmp', 'visit_report_id', 'report_id');
    }


    protected $table = 'visit_report';

    protected $primaryKey = 'report_id';

    public $timestamps = true;

    protected $fillable = [
        'remarks',
        'cust_id',
        'met_with',
        'issue_discussed',
        'issues',
        'uploads',
        'loc_lat',
        'loc_lng',
        'is_approved',
        'user_id',
        'date'
    ];

    protected $guarded = [];
}
