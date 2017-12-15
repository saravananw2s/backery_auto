<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class CreateApiAuthTable extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::create('api_auth', function(Blueprint $table)
		{
			$table->integer('auth_id', true);
			$table->text('auth_key', 65535);
			$table->timestamps();
			$table->text('auth_user_agent');
			$table->string('auth_ip', 45);
			$table->integer('is_active')->nullable()->default(1);
			$table->string('auth_model', 100);
			$table->integer('auth_user_id')->index('fk_api_auth_1_idx');
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
		Schema::drop('api_auth');
	}

}
