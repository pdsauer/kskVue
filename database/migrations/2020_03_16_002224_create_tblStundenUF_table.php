<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class CreateTblStundenUFTable extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::create('tblStundenUF', function(Blueprint $table)
		{
			$table->integer('UStd_ID', true);
			$table->integer('Std_Id');
			$table->integer('Auftrags_ID');
			$table->string('Tkurz', 6);
			$table->decimal('Std', 18)->nullable();
			$table->decimal('Km', 18)->nullable();
			$table->string('Bemerkungen')->nullable();
			$table->string('Bauherr')->nullable();
		});
	}


	/**
	 * Reverse the migrations.
	 *
	 * @return void
	 */
	public function down()
	{
		Schema::drop('tblStundenUF');
	}

}
