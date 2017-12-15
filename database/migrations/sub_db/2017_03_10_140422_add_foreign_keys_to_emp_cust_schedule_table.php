<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class AddForeignKeysToEmpCustScheduleTable extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::table('emp_cust_schedule', function(Blueprint $table)
		{
			$table->foreign('cust_id', 'fk_emp_cust_schedule_1')->references('id')->on('customers')->onUpdate('NO ACTION')->onDelete('NO ACTION');
			$table->foreign('emp_id', 'fk_emp_cust_schedule_2')->references('user_id')->on('user')->onUpdate('NO ACTION')->onDelete('NO ACTION');
			$table->foreign('emp_cust_id', 'fk_emp_cust_schedule_3')->references('id')->on('emp_schedule')->onUpdate('NO ACTION')->onDelete('NO ACTION');
		});
	}


	/**
	 * Reverse the migrations.
	 *
	 * @return void
	 */
	public function down()
	{
		Schema::table('emp_cust_schedule', function(Blueprint $table)
		{
			$table->dropForeign('fk_emp_cust_schedule_1');
			$table->dropForeign('fk_emp_cust_schedule_2');
			$table->dropForeign('fk_emp_cust_schedule_3');
		});
	}

}
