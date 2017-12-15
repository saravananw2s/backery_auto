<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class CreateCompetitorTable extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::create('competitor', function(Blueprint $table)
		{
			$table->integer('id', true);
			$table->string('name', 500);
			$table->text('desc', 65535)->nullable();
			$table->string('remark', 500)->nullable();
			$table->timestamps();
			$table->text('address')->nullable();
			$table->softDeletes();
			$table->string('loc_lat', 45)->nullable();
			$table->string('loc_lng', 45)->nullable();
			$table->text('uploads', 65535)->nullable();
		});
	}


	/**
	 * Reverse the migrations.
	 *
	 * @return void
	 */
	public function down()
	{
		Schema::drop('competitor');
	}

}
