<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class CreateProductOrdersTable extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::create('product_orders', function(Blueprint $table)
		{
			$table->integer('id', true);
			$table->integer('order_id')->index('fk_product_orders_1_idx');
			$table->integer('product_id')->index('fk_product_orders_2_idx');
			$table->string('pro_quantity', 45);
			$table->date('pro_req_date')->nullable();
			$table->timestamps();
			$table->softDeletes();
			$table->decimal('pro_price', 18);
		});
	}


	/**
	 * Reverse the migrations.
	 *
	 * @return void
	 */
	public function down()
	{
		Schema::drop('product_orders');
	}

}
