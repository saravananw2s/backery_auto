<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class CreateTravelExpReportTable extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::create('travel_exp_report', function(Blueprint $table)
		{
			$table->integer('id', true);
			$table->dateTime('start_date')->nullable();
			$table->dateTime('end_date')->nullable();
			$table->string('type', 45)->nullable()->default('0');
			$table->string('claim_id', 45)->nullable();
			$table->string('purpose', 500)->nullable();
			$table->integer('appr_status')->nullable()->default(0);
			$table->string('food_exp', 45)->nullable();
			$table->float('out_pdt', 10, 0)->nullable();
			$table->integer('travel_with_mngr')->nullable()->default(0);
			$table->string('total_exp', 45)->nullable();
			$table->string('travel_desc', 45)->nullable();
			$table->string('travel_by', 45)->nullable();
			$table->timestamps();
			$table->softDeletes();
			$table->float('extra_exp', 10, 0)->nullable();
			$table->text('notes', 65535)->nullable();
			$table->string('location', 500)->nullable();
			$table->integer('user_id')->nullable()->index('fk_travel_exp_report_1_idx');
			$table->text('uploads', 65535)->nullable();
			$table->integer('status')->nullable()->default(0);
		});
	}


	/**
	 * Reverse the migrations.
	 *
	 * @return void
	 */
	public function down()
	{
		Schema::drop('travel_exp_report');
	}

}
