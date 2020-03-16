<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class CreateTblStundenTable extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::create('tblStunden', function(Blueprint $table)
		{
			$table->integer('Std_ID', true);
			$table->string('Dat_Kuerz', 50);
			$table->date('Datum');
			$table->decimal('Von', 18)->nullable();
			$table->decimal('Bis', 18)->nullable();
			$table->decimal('Pause', 18)->nullable();
			$table->decimal('Std_gesamt', 18)->nullable();
			$table->decimal('Vonalt', 18)->nullable();
			$table->decimal('Bisalt', 18)->nullable();
			$table->decimal('Pausealt', 18)->nullable();
			$table->string('Schlüssel', 14)->nullable();
			$table->string('Username')->nullable();
			$table->timestamp('Eingabedatum')->nullable()->default(DB::raw('CURRENT_TIMESTAMP'));
			$table->integer('PersNr')->default(0);
		});
	}


	/**
	 * Reverse the migrations.
	 *
	 * @return void
	 */
	public function down()
	{
		Schema::drop('tblStunden');
	}

}
