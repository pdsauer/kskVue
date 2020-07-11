<?php

namespace App\Http\Controllers;

use App\Day_UF;
use App\Http\Requests\StoreDay_UF;
use App\Http\Requests\UpdateDay_UF;
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
     * Fetch all Days_UF_Ids belonging to the Day
     *
     *
     * @param int|null $id
     * @return day_UF[]|Collection
     */
    public function index(?int $id)
    {
        return Day_UF::where('Std_Id', $id)->get();
    }

    /**
     * return the  DAYS_UF belonging to the ID.
     *
     * @param Day_UF $day_UF
     * @return Day_UF
     */
    public function show(Day_UF $day_UF)
    {
        return $day_UF;
        //return Day_UF::where('UStd_ID', $id)->get();
    }

    /**
     * deletes Day_UF by id
     *
     * @param Day_UF $day_UF
     * @return void
     * @throws \Exception
     */
    public function destroy(Day_UF $day_UF)
    {
        // TODO: Check if it belongs to user
         $day_UF->delete();

    }


    /**
     * Store a newly created resource in storage.
     *
     * @param StoreDay_UF $request
     * @return ResponseFactory|Response
     */
    public function store(StoreDay_UF $request){

        $day_UF = new Day_UF;
        error_log(print_r('Store Activity', TRUE));
        //Validation
        $validatedData = $request->validated();

        error_log(print_r($validatedData, TRUE));

        $day_UF->Std_Id = $validatedData['data']['Std_Id'];
        $day_UF->Auftrags_ID = $validatedData['data']['project_ID'];
        // TODO: Check if primary key
        $day_UF->Tkurz = $validatedData['data']['activity'];
        $day_UF->Std = $validatedData['data']['hours'];
         $day_UF->km = $validatedData['data']['km'] ?? null;
        $day_UF->Bemerkungen = $validatedData['data']['remark'];
        $day_UF->Bauherr = $validatedData['data']['bauherr'] ?? null;

       try{
           $day_UF->save();
           error_log(print_r('Aktivitäten eingetragen', TRUE));
           return response('Success', 200);
       } catch (\Exception $e){
           error_log(print_r($e->getMessage(), TRUE));
           return response('Error', 500);
       }

    }

    /**
     * update a resource in storage.
     *
     * @param UpdateDay_UF $request
     * @return ResponseFactory|Response
     */
    public function update(UpdateDay_UF $request)
    {
        error_log(print_r('update Activity', TRUE));
        //Validation
        // TODO: Check if it belongs to user
        $validatedData = $request->validated();

        $day_UF = Day_UF::find((float) $validatedData['data']['UStd_ID']);
        //$day_UF::where('UStd_ID', $validatedData['data']['Std_Id']);
        $day_UF->Std_Id = $validatedData['data']['Std_Id'];
        $day_UF->Auftrags_ID = $validatedData['data']['project_ID'];
        $day_UF->Tkurz = $validatedData['data']['activity'];
        $day_UF->Std = $validatedData['data']['hours'];
        $day_UF->km = $validatedData['data']['km'] ?? null;
        $day_UF->Bemerkungen = $validatedData['data']['remark'];
        $day_UF->Bauherr = $validatedData['data']['bauherr'] ?? null;
        error_log(print_r($day_UF->Std, TRUE));

        try {
            $day_UF->save();
            return response('Success', 200);
        }
        catch (\Exception $e) {

            error_log(print_r($e->getMessage(), TRUE));
            return response('Error', 500);
        }


    }
}
