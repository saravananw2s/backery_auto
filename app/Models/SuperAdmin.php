<?php

namespace App\Models;


use Illuminate\Database\Eloquent\Model;
use OwenIt\Auditing\Auditable;
use OwenIt\Auditing\Contracts\Auditable as AuditableContract;
use Illuminate\Notifications\Notifiable;

class SuperAdmin extends Model implements AuditableContract
{
    use Auditable,Notifiable;




// use Illuminate\Database\Eloquent\Model;

// *
//  * Class SuperAdmin
 
// class SuperAdmin extends Model
// {
    protected $table = 'super_admin';



    public $timestamps = true;

    protected $fillable = [
        'email',
        'name',
        'desc',
        'pwd'
        ,'is_active'
    ];

    protected $guarded = [];
}
