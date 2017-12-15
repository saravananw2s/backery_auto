<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class CreateSuperAdminTable extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::create('super_admin', function(Blueprint $table)
		{
			$table->integer('id')->primary();
			$table->string('email', 45)->nullable();
			$table->string('name', 45)->nullable();
			$table->string('desc', 45)->nullable();
			$table->timestamps();
			$table->softDeletes();
			$table->text('pwd', 65535)->nullable();
			$table->integer('is_active')->nullable()->default(1);
		});
	}


	/**
	 * Reverse the migrations.
	 *
	 * @return void
	 */
	public function down()
	{
		Schema::drop('super_admin');
	}

}
