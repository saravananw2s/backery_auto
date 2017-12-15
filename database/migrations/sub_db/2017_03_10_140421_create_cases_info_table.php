<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class CreateCasesInfoTable extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::create('cases_info', function(Blueprint $table)
		{
			$table->integer('case_id', true);
			$table->date('open_dt')->nullable();
			$table->date('close_dt')->nullable();
			$table->integer('cust_id')->index('fk_cases_1_idx');
			$table->timestamps();
			$table->softDeletes();
			$table->integer('taken_by')->index('fk_cases_info_1_idx');
			$table->integer('status')->nullable()->default(0);
			$table->integer('closed_by')->nullable()->index('fk_cases_info_2_idx');
		});
	}


	/**
	 * Reverse the migrations.
	 *
	 * @return void
	 */
	public function down()
	{
		Schema::drop('cases_info');
	}

}
