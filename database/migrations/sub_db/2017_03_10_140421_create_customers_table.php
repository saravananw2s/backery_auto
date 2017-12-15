<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class CreateCustomersTable extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::create('customers', function(Blueprint $table)
		{
			$table->integer('id', true);
			$table->string('name', 45)->nullable();
			$table->string('address', 45)->nullable();
			$table->string('city', 45)->nullable();
			$table->string('state', 45)->nullable();
			$table->string('country', 45)->nullable();
			$table->string('zipcode', 45)->nullable();
			$table->string('contact_person', 45)->nullable();
			$table->string('contact_no', 45)->nullable();
			$table->string('pan', 45)->nullable();
			$table->string('tin', 45)->nullable();
			$table->string('type', 45)->nullable();
			$table->timestamps();
			$table->softDeletes();
			$table->string('email', 45)->nullable();
			$table->text('desc')->nullable();
			$table->string('loc_lat', 45)->nullable();
			$table->string('loc_lng', 45)->nullable();
			$table->string('district', 45)->nullable();
			$table->text('uploads', 65535)->nullable();
			$table->string('location', 45)->nullable();
			$table->integer('emp_id')->index('fk_customers_1_idx');
		});
	}


	/**
	 * Reverse the migrations.
	 *
	 * @return void
	 */
	public function down()
	{
		Schema::drop('customers');
	}

}
