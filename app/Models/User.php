<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use OwenIt\Auditing\Auditable;
use OwenIt\Auditing\Contracts\Auditable as AuditableContract;
use Illuminate\Notifications\Notifiable;

class User extends Model implements AuditableContract
{
    use Auditable,Notifiable;




    public function cust()
    {
        return $this->hasMany('App\Models\Customer', 'emp_id','user_id');
    }


    public function role()
    {
        return $this->hasOne('App\Models\UserRole', 'role_id', 'role_id');
    }

    protected $table = 'user';


    protected $primaryKey = 'user_id';

    public $timestamps = true;

    protected $hidden = array('user_pwd');

    protected $dates = ['deleted_at'];



    /**
     * Display timestamps in user's timezone
     */
    protected function asDateTime($value)
    {

        $value = \App\Http\Controllers\Base::ConvertTimezone($value);

        return $value;

    }

    protected $fillable = [
        'role_id',
        'first_name',
        'last_name',
        'user_pwd',
        'phone',
        'city',
        'street',
        'state',
        'zipcode',
        'email',
        'is_active',
        'activated_on',
        'last_login',
        'country',
        'phone_imei',
        'profile_image',
        'belongs_manager',
        'demo_links',
        'activity'
    ];

    protected $guarded = [];
}
