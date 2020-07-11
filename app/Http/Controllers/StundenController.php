<?php

namespace App\Http\Controllers;

use App\day;
use Illuminate\Http\Request;
use Carbon;
use Illuminate\Support\Facades\Auth;

class StundenController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('auth');
    }

    /**
     * Show Stundeneingabe.
     *
     * @return \Illuminate\Contracts\Support\Renderable
     */

    public function vue(){

        return view('form.activities');
    }  
}
