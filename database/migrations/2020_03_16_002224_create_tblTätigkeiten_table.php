<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class CreateTblTätigkeitenTable extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::create('tblTätigkeiten', function(Blueprint $table)
		{
			$table->string('T_kurz', 6)->primary('PK_Tätigkeiten');
			$table->string('Tätigkeit', 50)->nullable();
			$table->integer('alte_Nr')->nullable();
		});
	}


	/**
	 * Reverse the migrations.
	 *
	 * @return void
	 */
	public function down()
	{
		Schema::drop('tblTätigkeiten');
	}

}
