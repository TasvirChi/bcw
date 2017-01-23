package com.borhan.commands.jobs
{
	import com.borhan.vo.BorhanBatchJob;
	import com.borhan.vo.BorhanPullJobData;
	import com.borhan.delegates.jobs.JobsAddPullJobDelegate;
	import com.borhan.net.BorhanCall;

	public class JobsAddPullJob extends BorhanCall
	{
		public var filterFields : String;
		public function JobsAddPullJob( job : BorhanBatchJob,data : BorhanPullJobData )
		{
			service= 'jobs';
			action= 'addPullJob';

			var keyArr : Array = new Array();
			var valueArr : Array = new Array();
			var keyValArr : Array = new Array();
 			keyValArr = borhanObject2Arrays(job,'job');
			keyArr = keyArr.concat( keyValArr[0] );
			valueArr = valueArr.concat( keyValArr[1] );
 			keyValArr = borhanObject2Arrays(data,'data');
			keyArr = keyArr.concat( keyValArr[0] );
			valueArr = valueArr.concat( keyValArr[1] );
			applySchema( keyArr , valueArr );
		}

		override public function execute() : void
		{
			setRequestArgument('filterFields',filterFields);
			delegate = new JobsAddPullJobDelegate( this , config );
		}
	}
}
