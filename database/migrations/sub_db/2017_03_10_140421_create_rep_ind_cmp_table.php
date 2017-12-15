<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class CreateRepIndCmpTable extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::create('rep_ind_cmp', function(Blueprint $table)
		{
			$table->integer('id', true);
			$table->integer('comp_id')->nullable()->index('fk_rep_ind_cmp_2_idx');
			$table->text('product', 65535)->nullable();
			$table->string('rsp', 45)->nullable();
			$table->string('wsp', 45)->nullable();
			$table->string('stk', 45)->nullable();
			$table->integer('visit_report_id')->nullable()->index('fk_rep_ind_cmp_1_idx');
		});
	}


	/**
	 * Reverse the migrations.
	 *
	 * @return void
	 */
	public function down()
	{
		Schema::drop('rep_ind_cmp');
	}

}
