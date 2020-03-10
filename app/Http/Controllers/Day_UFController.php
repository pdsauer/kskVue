<?php

namespace App\Http\Controllers;

use App\Day_UF;
use Illuminate\Contracts\Routing\ResponseFactory;
use Illuminate\Database\Eloquent\Collection;
use Illuminate\Http\Request;
use Illuminate\Http\Response;

class Day_UFController extends Controller
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
     * Fetch all Days_UF
     *
     *
     * @return day_UF[]|Collection
     */
    public function index()
    {
        return  Day_UF::all();
    }

    /**
     * Display the list of all the DAYS_UF belonging to this DAY.
     *
     * @param int|null $id
     * @return Day_UF
     */
    public function show(?int $id)
    {
        return Day_UF::where('Std_Id', $id)->get();
    }


    /**
     * Store a newly created resource in storage.
     *
     * @param Request $request
     * @return ResponseFactory|Response
     */
    public function store(Request $request){

        $day_UF = new Day_UF();

        $validated = $request->validate([
            'Std_Id' => 'require|numeric',
            'Auftrags_ID' => 'require',
            'Tkurz' => 'require|string',
            'Std' => 'require|numeric',
            'Km' => 'numeric',
            'Bemerkung' => 'string',
            'Bauherr' => 'string'
        ]);

        // Store Day_UF in DB
        try{
            $day_UF->save();
        } catch (\Exception $e){
            error_log(print_r($e->getMessage(), TRUE));
        }

        return response('Success', 200);
    }
}
