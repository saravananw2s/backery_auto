<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class CreateNewProjectProductsTable extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::create('new_project_products', function(Blueprint $table)
		{
			$table->integer('id', true);
			$table->integer('new_project_opp_id')->index('fk_new_project_products_1_idx');
			$table->integer('product_id')->index('fk_new_project_products_2_idx');
			$table->string('quantity', 500)->nullable();
			$table->text('desc', 65535)->nullable();
		});
	}


	/**
	 * Reverse the migrations.
	 *
	 * @return void
	 */
	public function down()
	{
		Schema::drop('new_project_products');
	}

}
