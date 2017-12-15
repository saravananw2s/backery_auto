<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class CreateEmpScheduleTable extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::create('emp_schedule', function(Blueprint $table)
		{
			$table->integer('id', true);
			$table->integer('emp')->index('fk_emp_schedule_1_idx');
			$table->timestamps();
			$table->softDeletes();
			$table->integer('add_by')->index('fk_emp_schedule_2_idx');
			$table->date('date')->nullable();
		});
	}


	/**
	 * Reverse the migrations.
	 *
	 * @return void
	 */
	public function down()
	{
		Schema::drop('emp_schedule');
	}

}
