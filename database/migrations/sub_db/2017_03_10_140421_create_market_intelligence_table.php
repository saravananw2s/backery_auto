<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class CreateMarketIntelligenceTable extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::create('market_intelligence', function(Blueprint $table)
		{
			$table->integer('id', true);
			$table->text('uploads', 65535)->nullable();
			$table->text('desc')->nullable();
			$table->string('location', 120)->nullable();
			$table->string('loc_lat', 45)->nullable();
			$table->string('loc_lng', 45)->nullable();
			$table->timestamps();
			$table->softDeletes();
			$table->integer('taken_by')->nullable()->index('fk_market_intelligence_1_idx');
			$table->date('date')->nullable();
			$table->integer('is_approved')->nullable()->default(0);
		});
	}


	/**
	 * Reverse the migrations.
	 *
	 * @return void
	 */
	public function down()
	{
		Schema::drop('market_intelligence');
	}

}
