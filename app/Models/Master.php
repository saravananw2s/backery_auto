<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use OwenIt\Auditing\Auditable;
use Illuminate\Notifications\Notifiable;
use OwenIt\Auditing\Contracts\Auditable as AuditableContract;

/**
 * Class Master
 */
class Master extends Model implements AuditableContract
{
    use Auditable,Notifiable;


    public function db_info()
    {
        return $this->hasone('App\Models\CompanyDbInfo', 'company_id', 'company_id');
    }

    public function domain()
    {
        return $this->hasone('App\Models\CompanyDbInfo', 'company_id', 'company_id');
    }

    public function getIdAttribute()
    {
        return $this->attributes['company_id'];
    }


     public function routeNotificationForMail()
    {
        return $this->company_email;
    }




    protected $table = 'master';

    protected $primaryKey = 'company_id';


    public $timestamps = true;

    protected $hidden = array('company_pwd','deleted_at');

    protected $dates = ['deleted_at'];

    protected $fillable = [
        'company_name',
        'company_street',
        'company_city',
        'company_state',
        'company_zipcode',
        'company_url',
        'company_phone',
        'company_desc',
        'company_country',
        'company_pwd',
        'company_email',
        'logo'
    ];

    protected $guarded = [];
}
