<?php
namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use OwenIt\Auditing\Auditable;
use OwenIt\Auditing\Contracts\Auditable as AuditableContract;

class CasesInfoDetail extends Model implements AuditableContract
{
    use Auditable;

    public function cases_info()
    {
        return $this->hasone('App\Models\CasesInfo', 'case_id', 'case_id');
    }

    public function product()
    {
        return $this->hasone('App\Models\Product', 'product_id', 'product_id');
    }

    protected $table = 'case_info_details';

    protected $primaryKey = 'id';

    public $timestamps = true;

    protected $fillable = [
        'case_id',
        'case_type',
        'product_id',
        'batch_info',
        'invoice_no',
        'invoice_date',
        'site_info',
        'deliver_from',
        'order_no',
        'delivery_no',
        'delivery_date',
        'notes',
        'uploads'
    ];

    protected $guarded = [];
}
