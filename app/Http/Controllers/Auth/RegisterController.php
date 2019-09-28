<?php

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use App\User;
use Illuminate\Foundation\Auth\RegistersUsers;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;

class RegisterController extends Controller
{
    /*
    |--------------------------------------------------------------------------
    | Register Controller
    |--------------------------------------------------------------------------
    |
    | This controller handles the registration of new users as well as their
    | validation and creation. By default this controller uses a trait to
    | provide this functionality without requiring any additional code.
    |
    */

    use RegistersUsers;

    /**
     * Where to redirect users after registration.
     *
     * @var string
     */
    protected $redirectTo = '/home';

    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('guest');
    }

    /**
     * Get a validator for an incoming registration request.
     *
     * @param  array  $data
     * @return \Illuminate\Contracts\Validation\Validator
     */
    protected function validator(array $data)
    {
        return Validator::make($data, [
            'Kürzel' => ['required', 'string', 'max:255'],
            'PersNr' => ['required', 'numeric'],
            'Vorname' => ['required', 'string', 'max:255'],
            'Nachname' => ['required', 'string', 'max:255'],
            'Email' => ['required', 'string', 'email', 'max:255', 'unique:tblMitarbeiter'],
            'password' => ['required', 'string', 'min:8', 'confirmed'],
        ]);
    }

    /**
     * Create a new user instance after a valid registration.
     *
     * @param  array  $data
     * @return \App\User
     */
    protected function create(array $data)
    {
        return User::create([
            'Kürzel' => $data['Kürzel'],
            'PersNr' => $data['PersNr'],
            'Vorname' => $data['Vorname'],
            'Nachname' => $data['Nachname'],
            'Email' => $data['Email'],
            'password' => Hash::make($data['password']),
            'Std_Satz' => 10,
            'Büro_Nr' => 2,
            'Soll_Std_Tag' => 8,
            'Deaktiv' => false,
        ]);
    }
}
