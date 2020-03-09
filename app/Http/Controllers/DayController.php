<?php

namespace App\Http\Controllers;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Collection;
use Illuminate\Http\Request;
use App\Day;
use Illuminate\Http\Response;
use Illuminate\Support\Facades\Auth;

class DayController extends Controller
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
     * Fetch all Days belonging to the user
     *
     * @return day[]|Collection
     */
    public function index()
    {
        // TODO nur die Tage der letzen 3 Monatebereitstellen

        return  Day::where('PersNr', auth()->user()->PersNr)->get();
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\JsonResponse
     */
    public function store(Request $request)
    {
        //Validation
        $day = new Day;
        // ;
        // TODO: add comparison end > start
        $validatedData = $request->validate([
            '*.date' => 'required|date',
            '*.start' => 'required|numeric',
            '*.end' => 'required|numeric|gt:daySend.start',
            '*.pause' => 'required|numeric'
        ]);

        // error_log(print_r($validatedData['daySend']['end'], TRUE));
        $day->Datum = $validatedData['daySend']['date'];
        $day->Von = $validatedData['daySend']['start'];
        $day->Bis = $validatedData['daySend']['end'];
        $day->Pause = $validatedData['daySend']['pause'];
        $day->Dat_Kuerz = 'test';
        $day->Std_gesamt = ((float)($day->Bis) - (float)($day->Von) - (float)($day->Pause));
        $day->Eingabedatum = Carbon::now();
        $day->PersNr = auth()->user()->PersNr;

        // Store Day in DB
        $day->save();



        return response()->json(['status' => 'true']);
    }

    /**
     * Display the specified resource.
     *
     * @param Day $day
     * @return Day
     */
    public function show(Day $day)
    {
        // Bestimmten Tag anzeigen

        return $day;
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return Response
     */
    public function edit($id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return Response
     */
    public function update(Request $request, $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param Day $day
     * @return Response
     * @throws \Exception
     */
    public function destroy(Day $day)
    {
        // Check if day belongs to auth-User
        if ($day->PersNr = auth()->user()->PersNr){
            //delete Day
            $day->delete();
        }
        return null;
    }
}
