<?php
namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use OwenIt\Auditing\Auditable;
use OwenIt\Auditing\Contracts\Auditable as AuditableContract;

class CasesInfo extends Model implements AuditableContract
{
    use Auditable;

    public function customer()
    {
        return $this->hasone('App\Models\Customer', 'id', 'cus_id');
    }

    public function taken_by()
    {
        return $this->hasone('App\Models\User', 'user_id', 'taken_by');
    }

    public function closed_by()
    {
        return $this->hasone('App\Models\User', 'user_id', 'closed_by');
    }

    public function cases_info_detail()
    {
        return $this->hasMany('App\Models\CasesInfoDetail', 'case_id', 'case_id');
    }

    protected $table = 'cases_info';

    protected $primaryKey = 'case_id';

    public $timestamps = true;

    protected $fillable = [
        'open_dt',
        'close_dt',
        'cust_id',
        'taken_by',
        'closed_by',
        'status'
    ];

    protected $guarded = [];
}
