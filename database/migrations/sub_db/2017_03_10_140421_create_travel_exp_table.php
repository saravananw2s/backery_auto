<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class CreateTravelExpTable extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::create('travel_exp', function(Blueprint $table)
		{
			$table->integer('id', true);
			$table->integer('travel_report_id')->nullable()->index('fk_travel_exp_1_idx');
			$table->string('mode', 100)->nullable();
			$table->dateTime('start')->nullable();
			$table->dateTime('end')->nullable();
			$table->float('total_exp', 10, 0)->nullable();
			$table->float('total_kms', 10, 0)->nullable();
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
		Schema::drop('travel_exp');
	}

}
