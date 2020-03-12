<?php

use Illuminate\Database\Seeder;

class OrdersTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        //Fill tblAufträge mit Beispiel-Aufträgen
        DB::table('tblAufträge')->insert([
            'P_K' => 'k',
            'Büro_Nr' => 1,
            'lfdNr' => 13,
            'JahrAuftrag' => 2000,
            'Auftrags_Nr' => '100/013',
            'Auftrags_Nr_Alt' => 100013,
            'Bauort' => 'Kiel',
            'Straße' => 'Bahnhof',
            'Auftragg_KdNr' => 25,
            'Auftraggeber' => 'FH Kiel',
            'Bauherr_KdNr_Neu' => 25,
            'Bezeichnung_kurz' => 'Vorbau FH',
            'Bezeichnung_lang' => 'Vorbau Fachhochschule',
            'Nach_Zeitaufwand' => 0,
            'Auftrags_Datum' => \Carbon\Carbon::now(),
            'Schallschutz' => 'nein',
            'Wärmeschutz' => 'nein',
            'FWD' => 'nein',
            'Konstr_Überwachung' => 'nein',
            'Realisiert' => false,
        ]);

        DB::table('tblAufträge')->insert([
            'P_K' => 'k',
            'Büro_Nr' => 1,
            'lfdNr' => 13,
            'JahrAuftrag' => 2000,
            'Auftrags_Nr' => '100/014',
            'Auftrags_Nr_Alt' => 100013,
            'Bauort' => 'Kiel',
            'Straße' => 'Bahnhof',
            'Auftragg_KdNr' => 25,
            'Auftraggeber' => 'FH Kiel',
            'Bauherr_KdNr_Neu' => 25,
            'Bezeichnung_kurz' => 'Vorbau FH',
            'Bezeichnung_lang' => 'Vorbau Fachhochschule',
            'Nach_Zeitaufwand' => 0,
            'Auftrags_Datum' => \Carbon\Carbon::now(),
            'Schallschutz' => 'nein',
            'Wärmeschutz' => 'nein',
            'FWD' => 'nein',
            'Konstr_Überwachung' => 'nein',
            'Realisiert' => false,
        ]);

        DB::table('tblAufträge')->insert([
            'P_K' => 'k',
            'Büro_Nr' => 1,
            'lfdNr' => 13,
            'JahrAuftrag' => 2000,
            'Auftrags_Nr' => '100/015',
            'Auftrags_Nr_Alt' => 100013,
            'Bauort' => 'Kiel',
            'Straße' => 'Bahnhof',
            'Auftragg_KdNr' => 25,
            'Auftraggeber' => 'FH Kiel',
            'Bauherr_KdNr_Neu' => 25,
            'Bezeichnung_kurz' => 'Vorbau FH',
            'Bezeichnung_lang' => 'Vorbau Fachhochschule',
            'Nach_Zeitaufwand' => 0,
            'Auftrags_Datum' => \Carbon\Carbon::now(),
            'Schallschutz' => 'nein',
            'Wärmeschutz' => 'nein',
            'FWD' => 'nein',
            'Konstr_Überwachung' => 'nein',
            'Realisiert' => false,
        ]);
    }
}
