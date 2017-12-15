<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class CreateTravelHistoryTable extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::create('travel_history', function(Blueprint $table)
		{
			$table->integer('id', true);
			$table->integer('user_id')->index('fk_travel_history_1_idx');
			$table->string('accuracy', 80)->nullable();
			$table->string('speed', 80)->nullable();
			$table->string('bearing', 80)->nullable();
			$table->float('lat', 10, 6);
			$table->float('lng', 10, 6);
			$table->integer('activity')->nullable()->default(0);
			$table->timestamps();
			$table->softDeletes();
			$table->dateTime('timestamp')->nullable();
		});
	}


	/**
	 * Reverse the migrations.
	 *
	 * @return void
	 */
	public function down()
	{
		Schema::drop('travel_history');
	}

}
