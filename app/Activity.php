<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Activity extends Model
{
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'tblStundenUF';

    /**
     * The primary key associated with the table.
     *
     * @var string
     */
    protected $primaryKey = 'UStd_ID';

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'Std', 'Km', 'Bemerkung', 'Bauherr', 'TS'
    ];
}
