<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Order extends Model
{
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'tblAufträge';
    /**
     * Hide timestamps
     *
     * @var array
     */
    protected $hidden = array('TS');

    /**
     * The primary key associated with the table.
     *
     * @var string
     */
    protected $primaryKey = 'Auftrags_ID';

    /**
     * deactivate Timestamps
     *
     * @var boolean
     */
    public $timestamps = false;
}
