<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class AddForeignKeysToMarketTable extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::table('market', function(Blueprint $table)
		{
			$table->foreign('market_id', 'fk_market_1')->references('id')->on('market_intelligence')->onUpdate('NO ACTION')->onDelete('NO ACTION');
			$table->foreign('comp_id', 'fk_market_2')->references('id')->on('competitor')->onUpdate('NO ACTION')->onDelete('NO ACTION');
			$table->foreign('comp_activity_id', 'fk_market_3')->references('id')->on('activities')->onUpdate('NO ACTION')->onDelete('NO ACTION');
		});
	}


	/**
	 * Reverse the migrations.
	 *
	 * @return void
	 */
	public function down()
	{
		Schema::table('market', function(Blueprint $table)
		{
			$table->dropForeign('fk_market_1');
			$table->dropForeign('fk_market_2');
			$table->dropForeign('fk_market_3');
		});
	}

}
