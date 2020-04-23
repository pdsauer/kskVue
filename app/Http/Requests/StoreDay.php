<?php

namespace App\Http\Requests;

use App\Rules\ThreeMonthRule;
use App\Rules\UniqueDateDayPerUser;
use Illuminate\Foundation\Http\FormRequest;

class StoreDay extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     *
     * @return bool
     */
    public function authorize()
    {
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array
     */
    public function rules()
    {

        // TODO: add comparison end > start; Check if Date already exists for this user
        return [
            '*.date' => [
                'required',
                'date',
                new ThreeMonthRule(),
                new UniqueDateDayPerUser()
            ],
            '*.start' => 'required|numeric',
            '*.end' => 'required|numeric|gt:daySend.start',
            '*.pause' => 'required|numeric'
        ];
    }
}
