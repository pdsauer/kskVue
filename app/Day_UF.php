<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Day_UF extends Model
{

    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'tblStundenUF';


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
    protected $primaryKey = 'UStd_ID';


    /**
     * deactivate Timestamps
     *
     * @var boolean
     */
    public $timestamps = false;


    /**
     * The primary key is a string in this table.
     *
     * @var string
     */
    protected $keyType = 'string';


    /**
     * disbale autoincrement -> primary key = string
     *
     * @var bool
     */
    public $incrementing = false;


    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'Std_Id', 'Auftrags_ID', 'Tkurz', 'Std', 'Km', 'Bemerkung', 'Bauherr'
    ];
}
