<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class AddForeignKeysToNewProjectProductsTable extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::table('new_project_products', function(Blueprint $table)
		{
			$table->foreign('new_project_opp_id', 'fk_new_project_products_1')->references('id')->on('new_project_opp')->onUpdate('NO ACTION')->onDelete('NO ACTION');
			$table->foreign('product_id', 'fk_new_project_products_2')->references('product_id')->on('products')->onUpdate('NO ACTION')->onDelete('NO ACTION');
		});
	}


	/**
	 * Reverse the migrations.
	 *
	 * @return void
	 */
	public function down()
	{
		Schema::table('new_project_products', function(Blueprint $table)
		{
			$table->dropForeign('fk_new_project_products_1');
			$table->dropForeign('fk_new_project_products_2');
		});
	}

}
