<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class CreateAuthClientsTable extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::create('auth_clients', function(Blueprint $table)
		{
			$table->integer('client_id')->primary();
			$table->text('client_x_data', 65535)->nullable();
			$table->integer('auth_id')->nullable()->index('fk_auth_clients_1_idx');
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
		Schema::drop('auth_clients');
	}

}
