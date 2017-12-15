<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class AddForeignKeysToAuthClientsTable extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::table('auth_clients', function(Blueprint $table)
		{
			$table->foreign('auth_id', 'fk_auth_clients_1')->references('auth_id')->on('api_auth')->onUpdate('NO ACTION')->onDelete('NO ACTION');
		});
	}


	/**
	 * Reverse the migrations.
	 *
	 * @return void
	 */
	public function down()
	{
		Schema::table('auth_clients', function(Blueprint $table)
		{
			$table->dropForeign('fk_auth_clients_1');
		});
	}

}
