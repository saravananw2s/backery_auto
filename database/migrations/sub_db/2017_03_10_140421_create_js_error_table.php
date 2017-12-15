<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class CreateJsErrorTable extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::create('js_error', function(Blueprint $table)
		{
			$table->integer('id', true);
			$table->text('error', 65535)->nullable();
			$table->dateTime('created_at')->nullable();
			$table->text('user_agent', 65535)->nullable();
		});
	}


	/**
	 * Reverse the migrations.
	 *
	 * @return void
	 */
	public function down()
	{
		Schema::drop('js_error');
	}

}
