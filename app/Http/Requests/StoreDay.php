<?php

namespace App\Http\Requests;

use App\Rules\ThreeMonthRule;
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
        return false;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array
     */
    public function rules()
    {

        // TODO: add comparison end > start; Check if Date is younger than 3 months
        return [
            '*.date' => [
                'required',
                'date',
                new ThreeMonthRule()
            ],
            '*.start' => 'required|numeric',
            '*.end' => 'required|numeric|gt:daySend.start',
            '*.pause' => 'required|numeric'
        ];
    }
}
