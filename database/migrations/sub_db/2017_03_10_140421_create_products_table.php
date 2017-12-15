<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class CreateProductsTable extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::create('products', function(Blueprint $table)
		{
			$table->integer('product_id', true);
			$table->string('name', 45)->nullable();
			$table->float('price', 10, 0)->nullable();
			$table->string('unit', 500)->nullable();
			$table->integer('quantity')->nullable();
			$table->text('desc', 65535)->nullable();
			$table->text('photos')->nullable();
			$table->text('doc_info')->nullable();
			$table->integer('category')->index('fk_products_idx');
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
		Schema::drop('products');
	}

}
