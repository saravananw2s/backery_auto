<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class AddForeignKeysToOrderBookingsTable extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::table('order_bookings', function(Blueprint $table)
		{
			$table->foreign('cust_id', 'fk_order_bookings_1')->references('id')->on('customers')->onUpdate('NO ACTION')->onDelete('NO ACTION');
			$table->foreign('emp_id', 'fk_order_bookings_2')->references('user_id')->on('user')->onUpdate('NO ACTION')->onDelete('NO ACTION');
		});
	}


	/**
	 * Reverse the migrations.
	 *
	 * @return void
	 */
	public function down()
	{
		Schema::table('order_bookings', function(Blueprint $table)
		{
			$table->dropForeign('fk_order_bookings_1');
			$table->dropForeign('fk_order_bookings_2');
		});
	}

}
