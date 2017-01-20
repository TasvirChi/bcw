package com.borhan.commands.jobs
{
	import com.borhan.vo.BorhanBatchJob;
	import com.borhan.delegates.jobs.JobsAddBatchJobDelegate;
	import com.borhan.net.BorhanCall;

	public class JobsAddBatchJob extends BorhanCall
	{
		public var filterFields : String;
		public function JobsAddBatchJob( batchJob : BorhanBatchJob )
		{
			service= 'jobs';
			action= 'addBatchJob';

			var keyArr : Array = new Array();
			var valueArr : Array = new Array();
			var keyValArr : Array = new Array();
 			keyValArr = borhanObject2Arrays(batchJob,'batchJob');
			keyArr = keyArr.concat( keyValArr[0] );
			valueArr = valueArr.concat( keyValArr[1] );
			applySchema( keyArr , valueArr );
		}

		override public function execute() : void
		{
			setRequestArgument('filterFields',filterFields);
			delegate = new JobsAddBatchJobDelegate( this , config );
		}
	}
}
