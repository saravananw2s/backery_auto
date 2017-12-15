<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class CreateCompanyDbInfoTable extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::create('company_db_info', function(Blueprint $table)
		{
			$table->integer('company_id')->nullable()->index('master_db_link_idx');
			$table->string('sub_domain_url', 45)->nullable();
			$table->string('sub_db_host', 45)->nullable();
			$table->string('sub_db_port', 45)->nullable();
			$table->string('sub_db_user', 45)->nullable();
			$table->string('sub_db_name', 45)->nullable();
			$table->text('sub_db_pwd', 65535)->nullable();
			$table->timestamps();
			$table->softDeletes();
			$table->integer('id', true);
		});
	}


	/**
	 * Reverse the migrations.
	 *
	 * @return void
	 */
	public function down()
	{
		Schema::drop('company_db_info');
	}

}
