<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class CreateRequestsInfoTable extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::create('requests_info', function(Blueprint $table)
		{
			$table->integer('id', true);
			$table->integer('request_id')->index('fk_requests_info_1_idx');
			$table->string('type', 500)->nullable();
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
		Schema::drop('requests_info');
	}

}
