<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class AddForeignKeysToMarketIntelligenceTable extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::table('market_intelligence', function(Blueprint $table)
		{
			$table->foreign('taken_by', 'fk_market_intelligence_1')->references('user_id')->on('user')->onUpdate('NO ACTION')->onDelete('NO ACTION');
		});
	}


	/**
	 * Reverse the migrations.
	 *
	 * @return void
	 */
	public function down()
	{
		Schema::table('market_intelligence', function(Blueprint $table)
		{
			$table->dropForeign('fk_market_intelligence_1');
		});
	}

}
