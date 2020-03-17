<?php

namespace App\Rules;

use Carbon\Carbon;
use Illuminate\Contracts\Validation\Rule;

class ThreeMonthRule implements Rule
{
    /**
     * Create a new rule instance.
     * Die Eingegeben Tage dürfen nicht länger als 3 Monate her sein
     *
     * @return void
     */
    public function __construct()
    {
        //
    }

    /**
     * Determine if the validation rule passes.
     *
     * @param string $attribute
     * @param mixed $value
     * @return bool
     * @throws \Exception
     */
    public function passes($attribute, $value)
    {
        // Check if Date is max 3 Months away
        return Carbon::createFromTimeString($value)->gt(Carbon::today()->subMonths(3)) ;
    }

    /**
     * Get the validation error message.
     *
     * @return string
     */
    public function message()
    {
        return 'Das Datum ist älter als 3 Monate.';
    }
}
