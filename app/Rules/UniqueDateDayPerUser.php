<?php

namespace App\Rules;

use App\User;
use Illuminate\Contracts\Validation\Rule;
use Carbon\Carbon;
use DB;

class UniqueDateDayPerUser implements Rule
{
    /**
     * Create a new rule instance.
     *
     * @return void
     */
    public function __construct()
    {
        //
    }

    /**
     * Check if Datealready exists for User
     *
     * @param  string  $attribute
     * @param  mixed  $value
     * @return bool
     */
    public function passes($attribute, $value)
    {
        
        
        $result = !(auth()->user()->days->contains('Datum', Carbon::createFromTimeString($value)->format('Y-m-d')));
        return $result;
    }

    /**
     * Get the validation error message.
     *
     * @return string
     */
    public function message()
    {
        return 'Sie haben ein Tag mit diesem Datum schon abgegeben';
    }
}
