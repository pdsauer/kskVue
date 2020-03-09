<?php

namespace App\Http\Controllers;

use Illuminate\Database\Eloquent\Collection;
use Illuminate\Http\Request;
use App\Order;

class OrderController extends Controller
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
     * Show list of all Orders
     *
     * @return Order[]|Collection
     */
    public function index(){

        return Order::all();
    }


    /**
     * Show list of all Orders
     *
     * @param $id
     * @return Order[]|Collection
     */
    public function show($id){

        return Order::where('Auftrags_ID', $id)->get();
    }
}
