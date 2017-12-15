<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class CreateProductStatisticsTable extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::create('product_statistics', function(Blueprint $table)
		{
			$table->integer('id', true);
			$table->integer('prod_id')->index('fk_product_statistics_2_idx');
			$table->integer('cust_id')->index('fk_product_statistics_1_idx');
			$table->string('pdt_grade', 45)->nullable();
			$table->string('target', 45)->nullable();
			$table->string('actuals', 45)->nullable();
			$table->date('year')->nullable();
			$table->string('month', 45)->nullable();
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
		Schema::drop('product_statistics');
	}

}
