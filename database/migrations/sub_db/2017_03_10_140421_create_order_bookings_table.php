<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class CreateOrderBookingsTable extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::create('order_bookings', function(Blueprint $table)
		{
			$table->integer('order_booking_id', true);
			$table->integer('cust_id')->nullable()->index('fk_order_bookings_1_idx');
			$table->text('product_info', 65535)->nullable();
			$table->string('quote_ref', 100)->nullable();
			$table->string('po_num', 100)->nullable();
			$table->date('po_date')->nullable();
			$table->text('ship_to')->nullable();
			$table->text('bil_to')->nullable();
			$table->text('remarks')->nullable();
			$table->text('files_info', 65535)->nullable();
			$table->integer('emp_id')->index('fk_order_bookings_2_idx');
			$table->integer('status')->nullable()->default(0);
			$table->date('order_date');
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
		Schema::drop('order_bookings');
	}

}
