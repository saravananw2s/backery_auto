<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class CreateAuditsTable extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::create('audits', function(Blueprint $table)
		{
			$table->integer('id', true);
			$table->integer('auditable_id')->unsigned();
			$table->string('auditable_type');
			$table->text('old_values', 65535)->nullable();
			$table->text('new_values', 65535)->nullable();
			$table->string('user_id')->nullable();
			$table->string('url')->nullable();
			$table->string('ip_address', 45)->nullable();
			$table->timestamp('created_at')->default(DB::raw('CURRENT_TIMESTAMP'));
			$table->text('event', 65535)->nullable();
			$table->index(['auditable_id','auditable_type']);
		});
	}


	/**
	 * Reverse the migrations.
	 *
	 * @return void
	 */
	public function down()
	{
		Schema::drop('audits');
	}

}
