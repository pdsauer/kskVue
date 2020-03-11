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
        'Datum', 'Von', 'Bis', 'Pause'
    ];

    /**
     * Get the user asoociated with the post.
     * @return \Illuminate\Database\Eloquent\Relations\HasMany
     */
    public function Day_UF()
    {
        return $this->hasMany('App\Day_UF');
    }

    /**
     * Get the user asoociated with the post.
     * @return \Illuminate\Database\Eloquent\Relations\BelongsTo
     */
    public function user()
    {
        return $this->belongsTo('App\User', 'PersNr');
    }

}
