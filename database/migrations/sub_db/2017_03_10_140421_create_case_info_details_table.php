<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class CreateCaseInfoDetailsTable extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::create('case_info_details', function(Blueprint $table)
		{
			$table->integer('id', true);
			$table->integer('case_id')->index('fk_case_info_details_3_idx');
			$table->integer('case_type')->default(0);
			$table->integer('product_id')->nullable()->index('fk_case_info_details_1_idx');
			$table->string('batch_info', 500)->nullable();
			$table->string('invoice_no', 500)->nullable();
			$table->date('invoice_date')->nullable();
			$table->string('site_info', 500)->nullable();
			$table->string('deliver_from', 500)->nullable();
			$table->integer('order_no')->nullable()->index('fk_case_info_details_2_idx');
			$table->string('delivery_no', 500)->nullable();
			$table->date('delivery_date')->nullable();
			$table->timestamps();
			$table->softDeletes();
			$table->text('desc', 65535)->nullable();
			$table->text('uploads', 65535)->nullable();
			$table->text('notes', 65535)->nullable();
		});
	}


	/**
	 * Reverse the migrations.
	 *
	 * @return void
	 */
	public function down()
	{
		Schema::drop('case_info_details');
	}

}
