<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class AddForeignKeysToProductStatisticsTable extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::table('product_statistics', function(Blueprint $table)
		{
			$table->foreign('prod_id', 'fk_product_statistics_1')->references('product_id')->on('products')->onUpdate('NO ACTION')->onDelete('NO ACTION');
			$table->foreign('cust_id', 'fk_product_statistics_2')->references('id')->on('customers')->onUpdate('NO ACTION')->onDelete('NO ACTION');
		});
	}


	/**
	 * Reverse the migrations.
	 *
	 * @return void
	 */
	public function down()
	{
		Schema::table('product_statistics', function(Blueprint $table)
		{
			$table->dropForeign('fk_product_statistics_1');
			$table->dropForeign('fk_product_statistics_2');
		});
	}

}
