<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class CreateQualityCertTable extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::create('quality_cert', function(Blueprint $table)
		{
			$table->integer('id');
			$table->string('cert_id', 45)->primary();
			$table->string('comp_id', 45);
			$table->string('prod_id', 45);
			$table->string('bath_id', 45)->nullable();
			$table->string('year', 45)->nullable();
			$table->string('month', 45)->nullable();
			$table->string('week_no', 45)->nullable();
		});
	}


	/**
	 * Reverse the migrations.
	 *
	 * @return void
	 */
	public function down()
	{
		Schema::drop('quality_cert');
	}

}
