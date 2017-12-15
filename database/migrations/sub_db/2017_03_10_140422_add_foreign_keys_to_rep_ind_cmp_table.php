<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class AddForeignKeysToRepIndCmpTable extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::table('rep_ind_cmp', function(Blueprint $table)
		{
			$table->foreign('visit_report_id', 'fk_rep_ind_cmp_1')->references('report_id')->on('visit_report')->onUpdate('NO ACTION')->onDelete('NO ACTION');
			$table->foreign('comp_id', 'fk_rep_ind_cmp_2')->references('id')->on('competitor')->onUpdate('NO ACTION')->onDelete('NO ACTION');
		});
	}


	/**
	 * Reverse the migrations.
	 *
	 * @return void
	 */
	public function down()
	{
		Schema::table('rep_ind_cmp', function(Blueprint $table)
		{
			$table->dropForeign('fk_rep_ind_cmp_1');
			$table->dropForeign('fk_rep_ind_cmp_2');
		});
	}

}
