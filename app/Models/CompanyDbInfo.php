<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

use OwenIt\Auditing\Auditable;
use OwenIt\Auditing\Contracts\Auditable as AuditableContract;

/**
 * Class CompanyDbInfo
 */
class CompanyDbInfo extends Model implements AuditableContract
{
    use Auditable;

    public $timestamps = true;

    protected $dates = ['deleted_at'];

    protected $table = 'company_db_info';

    protected $hidden = array('sub_db_pwd','deleted_at');

    /**
        * Display timestamps in user's timezone
        */
       protected function asDateTime($value)
       {

           $value = \App\Http\Controllers\Base::ConvertTimezone($value);

           return $value;

       }



    public function company()
    {
        return $this->hasone('App\Models\Master', 'company_id', 'company_id');
    }



    protected $primaryKey = 'id';

    protected $fillable = [
        'sub_domain_url',
        'sub_db_host',
        'sub_db_port',
        'sub_db_user',
        'sub_db_name',
        'sub_db_pwd',
        'company_id'
    ];

    protected $guarded = [];
}
