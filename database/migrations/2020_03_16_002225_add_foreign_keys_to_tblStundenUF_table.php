<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class AddForeignKeysToTblStundenUFTable extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::table('tblStundenUF', function(Blueprint $table)
		{
			$table->foreign('Std_Id', 'FK_tblStundenUF_tblStunden')->references('Std_ID')->on('tblStunden')->onUpdate('CASCADE')->onDelete('CASCADE');
		});
	}


	/**
	 * Reverse the migrations.
	 *
	 * @return void
	 */
	public function down()
	{
		Schema::table('tblStundenUF', function(Blueprint $table)
		{
			$table->dropForeign('FK_tblStundenUF_tblStunden');
		});
	}

}
