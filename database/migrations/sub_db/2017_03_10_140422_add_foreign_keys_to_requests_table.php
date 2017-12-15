<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class AddForeignKeysToRequestsTable extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::table('requests', function(Blueprint $table)
		{
			$table->foreign('cust_id', 'fk_requests_1')->references('id')->on('customers')->onUpdate('NO ACTION')->onDelete('NO ACTION');
			$table->foreign('taken_by', 'fk_requests_2')->references('user_id')->on('user')->onUpdate('NO ACTION')->onDelete('NO ACTION');
		});
	}


	/**
	 * Reverse the migrations.
	 *
	 * @return void
	 */
	public function down()
	{
		Schema::table('requests', function(Blueprint $table)
		{
			$table->dropForeign('fk_requests_1');
			$table->dropForeign('fk_requests_2');
		});
	}

}
