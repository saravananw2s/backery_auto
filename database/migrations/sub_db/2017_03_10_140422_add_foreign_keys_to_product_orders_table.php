<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class AddForeignKeysToProductOrdersTable extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::table('product_orders', function(Blueprint $table)
		{
			$table->foreign('order_id', 'fk_product_orders_1')->references('order_booking_id')->on('order_bookings')->onUpdate('NO ACTION')->onDelete('NO ACTION');
			$table->foreign('product_id', 'fk_product_orders_2')->references('product_id')->on('products')->onUpdate('NO ACTION')->onDelete('NO ACTION');
		});
	}


	/**
	 * Reverse the migrations.
	 *
	 * @return void
	 */
	public function down()
	{
		Schema::table('product_orders', function(Blueprint $table)
		{
			$table->dropForeign('fk_product_orders_1');
			$table->dropForeign('fk_product_orders_2');
		});
	}

}
