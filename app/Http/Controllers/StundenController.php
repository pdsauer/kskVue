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
    public function index()
    {

        // Fill DayList
        $days = Day::where('PersNr', auth()->user()->PersNr)->get(['Std_ID', 'Datum']);
        return view('form.day', [
            'days' => $days
        ]);
    }

    /**
     * Speichert den ausgewählten Tag
     *
     * @param Request $request
     * @return void
     */

    /**
     * Wandelt 12:00 in 12,00 um
     *
     * TODO: Besseren Ort suchen
     *
     * @param Zeit $time
     * @return double
     */

    public function decimalHours($time){
        $hms = explode(":", $time);
        return ($hms[0].'.'.($hms[1]) * (1/6) );
    }

    /**
     * Store Day in DB via requset
     * TODO: Add description, test, if date already exists
     * @param Request $request
     * @return
     */
    public function store(Request $request)
    {

        // Validate Request - TODO Validate pause
        $validated = request()->validate([
            'datum' => ['required', 'Date'],
            'von' => ['required', 'date_format:H:i', 'before:bis'],
            'bis' => ['required', 'date_format:H:i'],
            'pause' => ['required', ],
        ]);

        // Store in Database
        $day = new Day;
        $day->Dat_Kuerz = 'test';
        $day->Datum = date('d-m-Y', strtotime($validated['datum']));
        $day->Von = $this->decimalHours($validated['von']);
        $day->Bis = $this->decimalHours($validated['bis']);
        $day->Pause = $this->decimalHours($validated['pause']);
        $day->Std_gesamt = ((float)($day->Bis) - (float)($day->Von) - (float)($day->Pause)); // In Stunden konvertieren  - strtotime($day->Pause)
        $day->PersNr = auth()->user()->PersNr;
        // $day->TS = null;
        // $day->Eingabedatum = Carbon\Carbon::now();

        $day->save();

        return redirect('/home');
    }
    /**
     * Show Day in DB via requset
     * TODO: Add description
     * @param
     * @return
     */
    public function show(Day $day)
    {

        $day = Day::where('Std_ID', $day->Std_ID)->first(['Std_ID', 'Datum', 'Von', 'Bis', 'Pause', 'PersNr']);
        // Check if User is allowed
        if($day->PersNr == auth()->user()->PersNr){

            // return $day;
            return view('form.showDay', [
                'showDay' => $day,
                'days' => $days = Day::where('PersNr', auth()->user()->PersNr)->get(['Std_ID', 'Datum'])
            ]);
        } else {

            return "Du darfst hier nicht hin!";
        }

    }

    /**
     * Store Day in DB via requset
     * TODO: Add description
     * @return Array $days Alle eingetragenen Tage des Users
     */
    public function showList()
    {
        // List of days for the current user
        $days = Day::where('PersNr', auth()->user()->PersNr)->get(['Std_ID', 'Datum']);

        return $days;
    }

}
