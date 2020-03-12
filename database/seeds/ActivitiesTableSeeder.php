<?php

use Illuminate\Database\Seeder;

class ActivitiesTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        //Fill database with basic Activities for Testing
        DB::table('tblTätigkeiten')->insert([
            'T_kurz' => 'bp',
            'Tätigkeit' => 'Bauplan aufstellen'
        ]);

        DB::table('tblTätigkeiten')->insert([
            'T_kurz' => 'mail',
            'Tätigkeit' => 'Emails bearbeiten'
        ]);

        DB::table('tblTätigkeiten')->insert([
            'T_kurz' => 'tel',
            'Tätigkeit' => 'telefonieren'
        ]);
    }
}
