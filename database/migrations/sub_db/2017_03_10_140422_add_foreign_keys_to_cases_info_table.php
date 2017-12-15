<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class AddForeignKeysToCasesInfoTable extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::table('cases_info', function(Blueprint $table)
		{
			$table->foreign('cust_id', 'fk_cases_1')->references('id')->on('customers')->onUpdate('NO ACTION')->onDelete('NO ACTION');
			$table->foreign('taken_by', 'fk_cases_info_1')->references('user_id')->on('user')->onUpdate('NO ACTION')->onDelete('NO ACTION');
			$table->foreign('closed_by', 'fk_cases_info_2')->references('user_id')->on('user')->onUpdate('NO ACTION')->onDelete('NO ACTION');
		});
	}


	/**
	 * Reverse the migrations.
	 *
	 * @return void
	 */
	public function down()
	{
		Schema::table('cases_info', function(Blueprint $table)
		{
			$table->dropForeign('fk_cases_1');
			$table->dropForeign('fk_cases_info_1');
			$table->dropForeign('fk_cases_info_2');
		});
	}

}
