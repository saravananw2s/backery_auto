<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class AddForeignKeysToCaseInfoDetailsTable extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::table('case_info_details', function(Blueprint $table)
		{
			$table->foreign('product_id', 'fk_case_info_details_1')->references('product_id')->on('products')->onUpdate('NO ACTION')->onDelete('NO ACTION');
			$table->foreign('order_no', 'fk_case_info_details_2')->references('order_booking_id')->on('order_bookings')->onUpdate('NO ACTION')->onDelete('NO ACTION');
			$table->foreign('case_id', 'fk_case_info_details_3')->references('case_id')->on('cases_info')->onUpdate('NO ACTION')->onDelete('NO ACTION');
		});
	}


	/**
	 * Reverse the migrations.
	 *
	 * @return void
	 */
	public function down()
	{
		Schema::table('case_info_details', function(Blueprint $table)
		{
			$table->dropForeign('fk_case_info_details_1');
			$table->dropForeign('fk_case_info_details_2');
			$table->dropForeign('fk_case_info_details_3');
		});
	}

}
