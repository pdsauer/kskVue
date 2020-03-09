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
    protected $table = 'tblTätigkeiten';

    /**
     * disbale autoincrement -> primary key = string
     *
     * @var bool
     */

    public $incrementing = false;

    /**
     * Hide timestamps
     *
     * @var array
     */
    protected $hidden = array('TS');
    /**
     * The primary key is a string in this table.
     *
     * @var string
     */
    protected $keyType = 'string';

    /**
     * The primary key associated with the table.
     *
     * @var string
     */
    protected $primaryKey = 'T_kurz';
}
