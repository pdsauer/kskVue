<?php

namespace App\Http\Requests;

use App\Rules\ThreeMonthRule;
use Illuminate\Foundation\Http\FormRequest;

class UpdateDay extends FormRequest
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


        return [
            '*.date' => [
                'required',
                'date',
                new ThreeMonthRule()
            ],
            '*.id' => 'required|numeric',
            '*.start' => 'required|numeric',
            '*.end' => 'required|numeric|gt:daySend.start',
            '*.pause' => 'required|numeric'
        ];
    }
}
