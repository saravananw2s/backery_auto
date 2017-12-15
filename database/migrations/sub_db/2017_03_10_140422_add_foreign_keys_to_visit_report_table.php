<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class AddForeignKeysToVisitReportTable extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::table('visit_report', function(Blueprint $table)
		{
			$table->foreign('cust_id', 'fk_visit_report_1')->references('id')->on('customers')->onUpdate('NO ACTION')->onDelete('NO ACTION');
		});
	}


	/**
	 * Reverse the migrations.
	 *
	 * @return void
	 */
	public function down()
	{
		Schema::table('visit_report', function(Blueprint $table)
		{
			$table->dropForeign('fk_visit_report_1');
		});
	}

}
