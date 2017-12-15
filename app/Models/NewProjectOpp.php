<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;


use OwenIt\Auditing\Auditable;
use OwenIt\Auditing\Contracts\Auditable as AuditableContract;

/**
 * Class NewProjectOpp
 */
class NewProjectOpp extends Model implements AuditableContract
{
    use Auditable;

    public function products()
    {
        return $this->hasMany('App\Models\NewProjectOppProd', 'new_project_opp_id', 'id');
    }



    protected $table = 'new_project_opp';

    public $timestamps = true;

    protected $fillable = [
        'lead_id',
        'name',
        'loc_lat',
        'loc_lng',
        'site_name',
        'prospect_type',
        'contact_name',
        'contact_no',
        'contact_email',
        'exp_date',
        'price_exp',
        'cement_used',
        'uploads',
        'desc',
        'location',
        'taken_by'
    ];

    protected $guarded = [];
}
