<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class CreateMarketTable extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::create('market', function(Blueprint $table)
		{
			$table->integer('id', true);
			$table->integer('comp_id')->nullable()->index('fk_market_2_idx');
			$table->integer('comp_activity_id')->nullable()->index('fk_market_3_idx');
			$table->text('comp_remark', 65535)->nullable();
			$table->integer('market_id')->nullable()->index('fk_market_1_idx');
		});
	}


	/**
	 * Reverse the migrations.
	 *
	 * @return void
	 */
	public function down()
	{
		Schema::drop('market');
	}

}
