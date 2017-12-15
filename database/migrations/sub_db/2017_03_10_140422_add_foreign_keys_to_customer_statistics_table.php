<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class AddForeignKeysToCustomerStatisticsTable extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::table('customer_statistics', function(Blueprint $table)
		{
			$table->foreign('cust_id', 'fk_customer_statistics_1')->references('id')->on('customers')->onUpdate('NO ACTION')->onDelete('NO ACTION');
		});
	}


	/**
	 * Reverse the migrations.
	 *
	 * @return void
	 */
	public function down()
	{
		Schema::table('customer_statistics', function(Blueprint $table)
		{
			$table->dropForeign('fk_customer_statistics_1');
		});
	}

}
