<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class CreateTblMitarbeiterTable extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::create('tblMitarbeiter', function(Blueprint $table)
		{
			$table->string('Kürzel', 3);
			$table->string('Anrede', 10)->nullable();
			$table->string('Titel', 50)->nullable();
			$table->string('Nachname', 50);
			$table->string('Vorname', 50);
			$table->string('Durchwahl', 5)->nullable();
			$table->integer('PersNr')->primary('PK_Mitarbeiter');
			$table->integer('Std_Satz');
			$table->string('Büro_Nr', 50);
			$table->decimal('Gruppe', 18)->nullable();
			$table->decimal('Soll_Std_Tag', 18);
			$table->decimal('AlteÜberStd', 18)->nullable();
			$table->dateTime('Letzte')->nullable()->comment('Datum letzte Änderung für AlteÜberStd');
			$table->decimal('Soll_U_Tage', 18, 1)->nullable();
			$table->integer('Resturlaubstage')->nullable();
			$table->integer('AusgezahlteUrlaubstage')->nullable();
			$table->integer('Akt_U_Tage')->nullable();
			$table->integer('Vj_Abschluss_Urlaubstage')->nullable();
			$table->decimal('Vj_Tarif_Tage', 18, 1)->nullable();
			$table->decimal('Vj_Resttage', 18, 1)->nullable();
			$table->decimal('Vj_Verbrauchte_Urlaubstage', 18, 1)->nullable();
			$table->dateTime('Speicherung_Akt_U_Tage')->nullable();
			$table->string('Berufsgruppe', 50)->nullable();
			$table->dateTime('Eintrittsdatum')->nullable();
			$table->dateTime('Austrittsdatum')->nullable();
			$table->boolean('Deaktiv');
			$table->dateTime('letzteAktualisierung')->nullable();
			$table->dateTime('Stichtag_ÜStdBerechnung')->nullable();
			$table->decimal('ÜStd_am_Stichtag', 18)->nullable();
			$table->string('Benutzer', 50)->nullable();
			$table->integer('ZugriffRechte')->nullable()->default(1);
			$table->string('Email')->nullable()->comment('In diesem Feld nur für Geschäftsführer Datum letzte Riinnerung eintragen');
			$table->dateTime('Erinnerung')->nullable();
			$table->boolean('ErinnerungJa')->nullable();
			$table->string('password')->nullable();
			$table->string('remember_token', 100)->nullable();
			$table->date('updated_at')->nullable();
			$table->date('created_at')->nullable();
		});
	}


	/**
	 * Reverse the migrations.
	 *
	 * @return void
	 */
	public function down()
	{
		Schema::drop('tblMitarbeiter');
	}

}
