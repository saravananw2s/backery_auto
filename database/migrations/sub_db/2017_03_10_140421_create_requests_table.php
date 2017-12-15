<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class CreateRequestsTable extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::create('requests', function(Blueprint $table)
		{
			$table->integer('id', true);
			$table->string('desc', 45)->nullable();
			$table->date('date')->nullable();
			$table->integer('cust_id')->nullable()->index('fk_requests_1_idx');
			$table->timestamps();
			$table->softDeletes();
			$table->text('uploads', 65535)->nullable();
			$table->integer('status')->nullable()->default(0);
			$table->integer('taken_by')->nullable()->index('fk_requests_2_idx');
		});
	}


	/**
	 * Reverse the migrations.
	 *
	 * @return void
	 */
	public function down()
	{
		Schema::drop('requests');
	}

}
