<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

/**
 * Class State
 */
class State extends Model
{
    protected $table = 'states';

    public $timestamps = false;

    protected $fillable = [
        'state_name',
        'country_id'
    ];

    protected $guarded = [];
}
