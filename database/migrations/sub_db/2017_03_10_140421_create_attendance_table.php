<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class CreateAttendanceTable extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::create('attendance', function(Blueprint $table)
		{
			$table->integer('id', true);
			$table->integer('user_id')->index('fk_attendance_1_idx');
			$table->dateTime('in_time')->nullable();
			$table->dateTime('out_time')->nullable();
			$table->integer('attent_type')->nullable()->default(0);
			$table->string('leave_desc', 45)->nullable();
			$table->string('login_lat', 45)->nullable();
			$table->string('login_lon', 45)->nullable();
			$table->string('logout_lat', 45)->nullable();
			$table->string('logout_lon', 45)->nullable();
			$table->timestamps();
			$table->softDeletes();
		});
	}


	/**
	 * Reverse the migrations.
	 *
	 * @return void
	 */
	public function down()
	{
		Schema::drop('attendance');
	}

}
