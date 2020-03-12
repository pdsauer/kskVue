<?php

use Illuminate\Database\Seeder;

class UserTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        //
        DB::table('tblMitarbeiter')->insert([
            'Kürzel' => 'pds',
            'Nachname' => 'Sauer',
            'Vorname' => 'Philipp',
            'PersNr' => 123,
            'Std_Satz' => 10.00,
            'Büro_Nr' => 2,
            'Soll_Std_Tag' => 8.00,
            'Deaktiv' => false,
            'ZugriffRechte' => 1,
            'Email' => 'pds@web.de',
            'password' => Hash::make('password')
        ]);

        DB::table('tblMitarbeiter')->insert([
            'Kürzel' => 'hcs',
            'Nachname' => 'Sauer',
            'Vorname' => 'Henrik',
            'PersNr' => 123,
            'Std_Satz' => 10.00,
            'Büro_Nr' => 2,
            'Soll_Std_Tag' => 8.00,
            'Deaktiv' => false,
            'ZugriffRechte' => 1,
            'Email' => 'hcs@web.de',
            'password' => Hash::make('password')
        ]);
    }
}
