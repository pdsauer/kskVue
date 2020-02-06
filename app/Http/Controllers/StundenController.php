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
     * Wandelt normale Uhrzeiten in Decimale STunden um
     *
     * TODO: Besseren Ort suchen
     *
     * @param Zeit $time
     * @return double
     */

    public function decimalHours($time){
        $hms = explode(":", $time);
        return ($hms[0].'.'.($hms[1]) * (10/6) );
    }

    /**
     * Wandelt decimale Uhrzeiten in normale STunden um
     *
     * TODO: Besseren Ort suchen
     *
     * @param string $time
     * @return double
     */

    public function normalHours($time){

        // Credit: https://stackoverflow.com/questions/9102680/how-to-convert-a-decimal-into-time-eg-hhmmss
        $h = intval($time);
        $m = round((((($time - $h) / 100.0) * 60.0) * 100), 0);
        if ($m == 60)
        {
            $h++;
            $m = 0;
        }
        $retval = sprintf("%02d:%02d", $h, $m);
        return $retval;
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
     * Show Stundeneingabe.
     *
     * @return \Illuminate\Contracts\Support\Renderable
     */
    
    public function vue(){

        return view('form.activities');
    }

    /**
     * Speichert den ausgewählten Tag
     *
     * @param Request $request
     * @return void
     */



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

        return redirect('/stunden/'.$day->Std_ID);
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
        // uhrzeiten zur Anzeige umwandeln
        $day->Von = $this->normalHours($day->Von);
        $day->Bis = $this->normalHours($day->Bis);
        $day->Pause = $this->normalHours($day->Pause);
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

    /**
     * Tag aus DB löschen
     * TODO: Add description und Tötigkeiten auch löschen
     * @return Array $days Alle eingetragenen Tage des Users
     */
    public function destroy($Std_ID){
        Day::find($Std_ID)->delete();
        return redirect('/stunden');
    }

    /**
     * Tag aus DB löschen
     * TODO: Add description und Tötigkeiten auch löschen
     * @return Array $days Alle eingetragenen Tage des Users
     */
    public function update($Std_ID){

        $validated = request()->validate([
            'datum' => ['required', 'Date'],
            'von' => ['required', 'date_format:H:i', 'before:bis'],
            'bis' => ['required', 'date_format:H:i'],
            'pause' => ['required', ],
        ]);

        $day =Day::find($Std_ID);

        $day->Von = $this->decimalHours($validated['von']);
        $day->Bis = $this->decimalHours($validated['bis']);
        $day->Pause = $this->decimalHours($validated['pause']);
        $day->Std_gesamt = ((float)($day->Bis) - (float)($day->Von) - (float)($day->Pause)); // In Stunden konvertieren  - strtotime($day->Pause)

        $day->save();

        return redirect('/stunden/'.$day->Std_ID);
    }
}
