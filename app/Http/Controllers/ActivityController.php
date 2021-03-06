<?php

namespace App\Http\Controllers;

use Illuminate\Database\Eloquent\Collection;
use Illuminate\Http\Request;
use App\Activity;

class ActivityController extends Controller
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
     * Show list of all Activities
     *
     * @return Activity[]|Collection
     */
    public function index(){

        return Activity::all();
    }

    /**
     * Show list of all Activities
     *
     * @param string $id
     * @return Activity[]|Collection
     */
    public function show(?string $id){

        return Activity::where('T_kurz', $id)->get();
    }
}
