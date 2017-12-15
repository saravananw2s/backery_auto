<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class CreateNewProjectOppTable extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::create('new_project_opp', function(Blueprint $table)
		{
			$table->integer('id', true);
			$table->string('lead_id', 500)->nullable();
			$table->string('name', 500)->nullable();
			$table->string('loc_lat', 45)->nullable();
			$table->string('loc_lng', 45)->nullable();
			$table->string('site_name', 500)->nullable();
			$table->integer('prospect_type')->nullable();
			$table->string('contact_name', 45)->nullable();
			$table->string('contact_no', 45)->nullable();
			$table->string('contact_email', 45)->nullable();
			$table->dateTime('exp_date')->nullable();
			$table->string('price_exp', 45)->nullable();
			$table->string('cement_used', 45)->nullable();
			$table->text('uploads')->nullable();
			$table->integer('taken_by')->nullable();
			$table->string('created_at', 45)->nullable();
			$table->string('updated_at', 45)->nullable();
			$table->string('deleted_at', 45)->nullable();
			$table->text('desc', 65535)->nullable();
			$table->string('location', 500)->nullable();
			$table->date('date')->nullable();
		});
	}


	/**
	 * Reverse the migrations.
	 *
	 * @return void
	 */
	public function down()
	{
		Schema::drop('new_project_opp');
	}

}
