<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class day extends Model
{
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'tblStunden';

    /**
     * The primary key associated with the table.
     *
     * @var string
     */
    protected $primaryKey = 'Std_ID';

    /**
     * deactivate Timestamps
     *
     * @var boolean
     */

    public $timestamps = false;


    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'Dat_Kuerz', 'Datum', 'Von', 'Bis', 'Pause', 'Std_gesamt', 'Eingabedatum', 'PersNr', 'TS'
    ];

}
