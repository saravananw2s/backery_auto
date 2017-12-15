<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class CreateUserTable extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::create('user', function(Blueprint $table)
		{
			$table->integer('user_id', true);
			$table->integer('role_id')->nullable()->index('fk_user_1_idx');
			$table->string('first_name', 45)->nullable();
			$table->string('last_name', 45)->nullable();
			$table->text('user_pwd', 65535)->nullable();
			$table->string('phone', 45)->nullable();
			$table->string('city', 45)->nullable();
			$table->string('street', 45)->nullable();
			$table->string('state', 45)->nullable();
			$table->string('zipcode', 45)->nullable();
			$table->timestamps();
			$table->string('email', 45)->unique('email_UNIQUE');
			$table->boolean('is_active')->nullable()->default(0);
			$table->dateTime('activated_on')->nullable();
			$table->dateTime('last_login')->nullable();
			$table->string('country', 45)->nullable();
			$table->string('phone_imei', 45)->nullable();
			$table->softDeletes();
			$table->string('profile_image', 500)->nullable();
			$table->integer('belongs_manager')->nullable();
		});
	}


	/**
	 * Reverse the migrations.
	 *
	 * @return void
	 */
	public function down()
	{
		Schema::drop('user');
	}

}
