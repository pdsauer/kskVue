<?php

namespace App;

use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;

class User extends Authenticatable
{

    use Notifiable;
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'tblMitarbeiter';

    /**
     * The primary key associated with the table.
     *
     * @var string
     */
    protected $primaryKey = 'PersNr';

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'Vorname', 'Nachname', 'Email', 'password', 'Kürzel', 'PersNr', 'Std_Satz', 'Büro_Nr', 'Soll_Std_Tag', 'Deaktiv'
    ];

    /**
     * The attributes that should be hidden for arrays.
     *
     * @var array
     */
    protected $hidden = [
        'password', 'remember_token',
    ];

    /**
     * The attributes that should be cast to native types.
     *
     * @var array
     */
    protected $casts = [
        'email_verified_at' => 'date',
    ];

    /**
     * Get the posts asoociated with the user.
     * @return \Illuminate\Database\Eloquent\Relations\HasMany
     */
    public function posts()
    {
        return $this->hasMany('App\Post', 'id');
    }
}
