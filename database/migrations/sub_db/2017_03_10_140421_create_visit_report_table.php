<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class CreateVisitReportTable extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::create('visit_report', function(Blueprint $table)
		{
			$table->integer('report_id', true);
			$table->text('remarks', 65535)->nullable();
			$table->integer('cust_id')->nullable()->index('fk_visit_report_1_idx');
			$table->string('met_with', 500)->nullable();
			$table->text('issue_discussed', 65535)->nullable();
			$table->text('issues', 65535)->nullable();
			$table->text('uploads')->nullable();
			$table->string('loc_lat', 45)->nullable();
			$table->string('loc_lng', 45)->nullable();
			$table->timestamps();
			$table->softDeletes();
			$table->integer('is_approved')->nullable()->default(0);
			$table->integer('user_id')->nullable();
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
		Schema::drop('visit_report');
	}

}
