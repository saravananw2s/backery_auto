<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class CreateTravelExpHotelTable extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::create('travel_exp_hotel', function(Blueprint $table)
		{
			$table->integer('id', true);
			$table->integer('travel_report_id')->nullable()->index('fk_travel_exp_hotel_1_idx');
			$table->dateTime('check_in')->nullable();
			$table->dateTime('check_out')->nullable();
			$table->text('hotel_info', 65535)->nullable();
			$table->float('total_exp', 10, 0)->nullable();
			$table->text('desc', 65535)->nullable();
		});
	}


	/**
	 * Reverse the migrations.
	 *
	 * @return void
	 */
	public function down()
	{
		Schema::drop('travel_exp_hotel');
	}

}
