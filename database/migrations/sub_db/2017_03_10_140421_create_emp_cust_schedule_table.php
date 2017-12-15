<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class CreateEmpCustScheduleTable extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::create('emp_cust_schedule', function(Blueprint $table)
		{
			$table->integer('id', true);
			$table->integer('cust_id')->index('fk_emp_cust_schedule_1_idx');
			$table->date('date')->nullable();
			$table->string('status', 45)->nullable()->default('waiting');
			$table->string('type', 45)->nullable();
			$table->string('notes', 45)->nullable();
			$table->integer('emp_id')->nullable()->index('fk_emp_cust_schedule_2_idx');
			$table->timestamps();
			$table->softDeletes();
			$table->integer('emp_cust_id')->nullable()->index('fk_emp_cust_schedule_3_idx');
		});
	}


	/**
	 * Reverse the migrations.
	 *
	 * @return void
	 */
	public function down()
	{
		Schema::drop('emp_cust_schedule');
	}

}
