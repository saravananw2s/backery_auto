<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

use OwenIt\Auditing\Auditable;
use OwenIt\Auditing\Contracts\Auditable as AuditableContract;

/**
 * Class UserRole
 */
class UserRole extends Model implements AuditableContract
{
    use Auditable;
    
    protected $table = 'user_roles';

    protected $primaryKey = 'role_id';

    public $timestamps = false;

    protected $fillable = [
        'name',
        'desc',
        'created_on'
    ];

    protected $guarded = [];
}
