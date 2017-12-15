<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class AddForeignKeysToEmpScheduleTable extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::table('emp_schedule', function(Blueprint $table)
		{
			$table->foreign('emp', 'fk_emp_schedule_1')->references('user_id')->on('user')->onUpdate('NO ACTION')->onDelete('NO ACTION');
			$table->foreign('add_by', 'fk_emp_schedule_2')->references('user_id')->on('user')->onUpdate('NO ACTION')->onDelete('NO ACTION');
		});
	}


	/**
	 * Reverse the migrations.
	 *
	 * @return void
	 */
	public function down()
	{
		Schema::table('emp_schedule', function(Blueprint $table)
		{
			$table->dropForeign('fk_emp_schedule_1');
			$table->dropForeign('fk_emp_schedule_2');
		});
	}

}
