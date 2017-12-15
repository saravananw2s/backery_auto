<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class CreateSessionClientsTable extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::create('session_clients', function(Blueprint $table)
		{
			$table->integer('id', true);
			$table->string('client_ip', 45);
			$table->string('client_data', 45)->nullable();
			$table->string('client_info', 200);
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
		Schema::drop('session_clients');
	}

}
