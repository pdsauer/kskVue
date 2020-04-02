<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class UpdateDay_UF extends FormRequest
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
        return [
            //
            '*.UStd_ID' => 'required|numeric',
            '*.Std_Id' => 'required|numeric',
            '*.project_ID' => 'required|numeric',
            '*.activity' => 'required|string',
            '*.hours' => 'required|numeric',
            '*.remark' => 'nullable|string',
            '*.km' => 'nullable|numeric',
            '*.bauherr' => 'nullable|string'
        ];
    }
}
