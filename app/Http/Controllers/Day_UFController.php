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
     * Fetch all Days_UF_Ids belonging to the Day
     *
     *
     * @param int|null $id
     * @return day_UF[]|Collection
     */
    public function index(?int $id)
    {
        return Day_UF::where('Std_Id', $id)->pluck('UStd_ID');
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
         $day_UF->delete();

    }


    /**
     * Store a newly created resource in storage.
     *
     * @param Request $request
     * @return ResponseFactory|Response
     */
    public function store(Request $request){


        $day_UF = new Day_UF;

        //Validation

        error_log(print_r($request->all(), TRUE));

/*        $validatedData = $request->validate([
            '*.Std_Id' => 'required|numeric',
            '*.project_ID' => 'required|numeric',
            '*.activity' => 'required|string',
            '*.hours' => 'required|numeric',
            '*.km' => 'numeric',
            '*.remark' => 'string',
            '*.bauherr' => 'string'
        ]);*/
        $validatedData = $request->validate([
            '*.Std_Id' => 'numeric',
            '*.project_ID' => 'numeric',
            '*.activity' => 'string',
            '*.hours' => 'numeric',
            '*.km' => 'numeric',
            '*.remark' => 'string',
            '*.bauherr' => 'string'
        ]);
        error_log(print_r($validatedData['data'], TRUE));

        $day_UF->Std_Id = $validatedData['data']['Std_Id'];
        $day_UF->Auftrags_ID = $validatedData['data']['project_ID'];
        $day_UF->Tkurz = $validatedData['data']['activity'];
        $day_UF->Std = $validatedData['data']['hours'];
        //$day_UF->km = $validatedData['data']['km'];
        $day_UF->Bemerkungen = $validatedData['data']['remark'];
        // $day_UF->Bauherr = $validatedData['data']['bauherr'];



        $day_UF->save();

/*        try{
            $day_UF->save();
        } catch (\Exception $e){
            error_log(print_r($e->getMessage(), TRUE));
        }*/

        return response('Success', 200);
    }
}
