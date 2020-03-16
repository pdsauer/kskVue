<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class CreateTblAufträgeTable extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::create('tblAufträge', function(Blueprint $table)
		{
			$table->integer('Auftrags_ID', true);
			$table->string('P_K', 1);
			$table->string('Büro_Nr', 1);
			$table->integer('lfdNr')->nullable();
			$table->integer('JahrAuftrag')->nullable();
			$table->string('Auftrags_Nr', 50);
			$table->string('Auftrags_Nr_Alt', 6)->nullable();
			$table->string('Bauort', 50)->nullable();
			$table->string('Straße', 50)->nullable();
			$table->string('Aktenzeichen', 50)->nullable();
			$table->integer('Auftragg_KdNr')->nullable();
			$table->string('Auftraggeber')->nullable();
			$table->string('Auftragg_KdNr_An', 5)->nullable();
			$table->integer('Auftragg_AP')->nullable();
			$table->string('Auftragg_AP_An', 5)->nullable();
			$table->string('AuftragAnsprechpartner')->nullable();
			$table->string('Kreis', 50)->nullable();
			$table->char('Kreis_KdNr', 10)->nullable();
			$table->string('Kreis_An', 5)->nullable();
			$table->integer('Bauherr_KdNr_Neu')->nullable();
			$table->string('Bauherr')->nullable();
			$table->string('Bauherr_KdNr_Neu_An', 5)->nullable();
			$table->integer('Architekt_KdNr')->nullable();
			$table->string('Architekt')->nullable();
			$table->string('Architekt_KdNr_Ueber', 5)->nullable();
			$table->integer('Aufsteller_KdNr')->nullable();
			$table->string('Aufsteller')->nullable();
			$table->string('Aufsteller_KdNr_Ueber', 5)->nullable();
			$table->string('Bezeichnung_kurz', 50);
			$table->string('Bezeichnung_lang')->nullable();
			$table->string('Bauartkennzahl', 50)->nullable();
			$table->integer('Bauwerkskl')->nullable();
			$table->string('Gebaeudeart', 20)->nullable();
			$table->integer('Anr_Kosten')->nullable();
			$table->boolean('Nach_Zeitaufwand')->nullable();
			$table->dateTime('Auftrags_Datum')->nullable();
			$table->dateTime('Termin')->nullable();
			$table->dateTime('Enddatum')->nullable();
			$table->string('Schallschutz', 4)->nullable();
			$table->string('Wärmeschutz', 4)->nullable();
			$table->string('FWD', 4)->nullable();
			$table->string('Konstr_Überwachung', 4)->nullable();
			$table->boolean('Realisiert')->nullable();
			$table->string('Schlußbericht')->nullable();
			$table->boolean('SKP')->nullable();
			$table->string('Link')->nullable();
			$table->integer('Nummer')->nullable();
			$table->integer('Stundensatz')->nullable();
			$table->decimal('Indexzahl', 18, 3)->nullable();
			$table->integer('PersNr')->nullable();
		});
	}


	/**
	 * Reverse the migrations.
	 *
	 * @return void
	 */
	public function down()
	{
		Schema::drop('tblAufträge');
	}

}
