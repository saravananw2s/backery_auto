<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class AddForeignKeysToRequestsInfoTable extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::table('requests_info', function(Blueprint $table)
		{
			$table->foreign('request_id', 'fk_requests_info_1')->references('id')->on('requests')->onUpdate('NO ACTION')->onDelete('NO ACTION');
		});
	}


	/**
	 * Reverse the migrations.
	 *
	 * @return void
	 */
	public function down()
	{
		Schema::table('requests_info', function(Blueprint $table)
		{
			$table->dropForeign('fk_requests_info_1');
		});
	}

}
