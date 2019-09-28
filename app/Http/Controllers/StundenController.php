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
        $day->Von = $validated['von'];
        $day->Bis = $validated['bis'];
        $day->Pause = $validated['pause'];
        $day->Std_gesamt = (strtotime($validated['bis'])  - strtotime($validated['von'])- strtotime($validated['pause'])) / 3600; // In Stunden konvertieren
        $day->PersNr = auth()->user()->PersNr;
        $day->Eingabedatum = Carbon\Carbon::now();

        $day->save();

        return redirect('/home');
    }
}
