<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class AddForeignKeysToTravelExpReportTable extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::table('travel_exp_report', function(Blueprint $table)
		{
			$table->foreign('user_id', 'fk_travel_exp_report_1')->references('user_id')->on('user')->onUpdate('NO ACTION')->onDelete('NO ACTION');
		});
	}


	/**
	 * Reverse the migrations.
	 *
	 * @return void
	 */
	public function down()
	{
		Schema::table('travel_exp_report', function(Blueprint $table)
		{
			$table->dropForeign('fk_travel_exp_report_1');
		});
	}

}
