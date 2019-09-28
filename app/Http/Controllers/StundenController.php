<?php

namespace App\Http\Controllers;

use App\day;
use Illuminate\Http\Request;
use Carbon;

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
        return view('form.day');
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
        return ($hms[0] + ($hms[1]/60));
    }

    public function store(Request $request)
    {

        // Validate Request - TODO Validate pause
        $validated = request()->validate([
            'datum' => ['required', 'Date'],
            'von' => ['required', 'date_format:H:i'],
            'bis' => ['required', 'date_format:H:i'],
            'pause' => ['required', ],
        ]);

        // Store in Database
        $day = new Day;
        $day->Dat_Kuerz = 'test';
        $day->Datum = $validated['datum'];
        $day->Von = $this->decimalHours($validated['von']);
        $day->Bis = $this->decimalHours($validated['bis']);
        $day->Pause = $validated['pause'];
        $day->Std_gesamt = (strtotime($validated['bis'])  - strtotime($validated['von'])- strtotime($validated['pause'])) / 3600; // In Stunden konvertieren
        $day->PersNr = auth()->user()->PersNr;
        // $day->Eingabedatum = Carbon\Carbon::now();

        $day->save();

        return redirect('/home');
    }
}
