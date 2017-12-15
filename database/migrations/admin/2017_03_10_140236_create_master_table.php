<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class CreateMasterTable extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::create('master', function(Blueprint $table)
		{
			$table->string('company_name', 45);
			$table->string('company_street', 45)->nullable();
			$table->string('company_city', 45)->nullable();
			$table->string('company_state', 45)->nullable();
			$table->string('company_zipcode', 45)->nullable();
			$table->string('company_url', 45)->nullable();
			$table->string('company_phone', 45)->nullable();
			$table->text('company_desc', 65535)->nullable();
			$table->integer('company_id', true);
			$table->timestamps();
			$table->string('company_country', 45)->nullable();
			$table->text('company_pwd', 65535)->nullable();
			$table->string('company_email', 45);
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
		Schema::drop('master');
	}

}
