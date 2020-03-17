<?php

namespace App\Http\Controllers;

use App\Http\Requests\StoreDay;
use App\User;
use Carbon\Carbon;
use Illuminate\Contracts\Routing\ResponseFactory;
use Illuminate\Database\Eloquent\Collection;
use Illuminate\Http\JsonResponse;
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

        return (\auth()->user()->days);
        //return  Day::where('PersNr', auth()->user()->PersNr)->get();
    }


    /**
     * Store a newly created resource in storage.
     *
     * @param StoreDay $request
     * @return ResponseFactory|Response
     */
    public function store(StoreDay $request)
    {
        // error_log(print_r($request->all(), TRUE));
        //Validation
        $validatedData = $request->validated();
        $day = new Day;

        $day->Datum = $validatedData['daySend']['date'];
        $day->Von = $validatedData['daySend']['start'];
        $day->Bis = $validatedData['daySend']['end'];
        $day->Pause = $validatedData['daySend']['pause'];
        $day->Dat_Kuerz = 'test';
        $day->Std_gesamt = ((float)($day->Bis) - (float)($day->Von) - (float)($day->Pause));
        $day->Eingabedatum = Carbon::now();
        $day->PersNr = auth()->user()->PersNr;

        // Store Day in DB
        try{
            $day->save();
            return response(array('success' => true, 'insert_id' => $day->Std_ID), 200);
        } catch (\Exception $e){
            error_log(print_r($e->getMessage(), TRUE));
            return response('error', 500);
        }

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
     * Update the specified resource in storage.
     *
     * @param Request $request
     * @return ResponseFactory|Response
     */
    public function update(Request $request)
    {
        // Validate

        /*Rule::unique('tblStunden')->where(
            function($query) {$query->where('PersNr', auth()->user()->PersNr);
            })*/


 /*       $validatedData = $request->validate([
            '*.id' => 'required|numeric',
            '*.date' => [
                'required',
                'date',
            ],
            '*.start' => 'required|numeric',
            '*.end' => 'required|numeric|gt:daySend.start',
            '*.pause' => 'required|numeric'
        ]); */

        $day = Day::find($validatedData['daySend']['id']);

        $day->Datum = $validatedData['daySend']['date'];
        $day->Von = $validatedData['daySend']['start'];
        $day->Bis = $validatedData['daySend']['end'];
        $day->Pause = $validatedData['daySend']['pause'];
        $day->Std_gesamt = ((float)($day->Bis) - (float)($day->Von) - (float)($day->Pause));

        try {
            $day->save();
            return response('Success', 200);
        } catch (\Exception $e){
            error_log(print_r($e->getMessage(), TRUE));
            return response('Error', 500);
        }


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
