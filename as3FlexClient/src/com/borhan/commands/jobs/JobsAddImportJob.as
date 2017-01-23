package com.borhan.commands.jobs
{
	import com.borhan.vo.BorhanBatchJob;
	import com.borhan.vo.BorhanImportJobData;
	import com.borhan.delegates.jobs.JobsAddImportJobDelegate;
	import com.borhan.net.BorhanCall;

	public class JobsAddImportJob extends BorhanCall
	{
		public var filterFields : String;
		public function JobsAddImportJob( job : BorhanBatchJob,data : BorhanImportJobData )
		{
			service= 'jobs';
			action= 'addImportJob';

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
			delegate = new JobsAddImportJobDelegate( this , config );
		}
	}
}
