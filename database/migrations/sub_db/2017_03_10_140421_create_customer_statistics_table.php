<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class CreateCustomerStatisticsTable extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::create('customer_statistics', function(Blueprint $table)
		{
			$table->integer('id', true);
			$table->integer('cust_id')->index('fk_customer_statistics_1_idx');
			$table->date('year')->nullable();
			$table->integer('month')->nullable();
			$table->string('credit_limit', 45)->nullable();
			$table->string('credit_terms', 45)->nullable();
			$table->string('outstandings', 45)->nullable();
			$table->dateTime('last_visited')->nullable();
			$table->string('over_due', 45)->nullable();
			$table->timestamps();
			$table->softDeletes();
		});
	}


	/**
	 * Reverse the migrations.
	 *
	 * @return void
	 */
	public function down()
	{
		Schema::drop('customer_statistics');
	}

}
