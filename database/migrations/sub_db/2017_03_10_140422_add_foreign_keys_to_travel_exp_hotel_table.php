<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class AddForeignKeysToTravelExpHotelTable extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::table('travel_exp_hotel', function(Blueprint $table)
		{
			$table->foreign('travel_report_id', 'fk_travel_exp_hotel_1')->references('id')->on('travel_exp_report')->onUpdate('NO ACTION')->onDelete('NO ACTION');
		});
	}


	/**
	 * Reverse the migrations.
	 *
	 * @return void
	 */
	public function down()
	{
		Schema::table('travel_exp_hotel', function(Blueprint $table)
		{
			$table->dropForeign('fk_travel_exp_hotel_1');
		});
	}

}
