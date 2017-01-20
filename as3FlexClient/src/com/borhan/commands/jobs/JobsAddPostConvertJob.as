package com.borhan.commands.jobs
{
	import com.borhan.vo.BorhanBatchJob;
	import com.borhan.vo.BorhanPostConvertJobData;
	import com.borhan.delegates.jobs.JobsAddPostConvertJobDelegate;
	import com.borhan.net.BorhanCall;

	public class JobsAddPostConvertJob extends BorhanCall
	{
		public var filterFields : String;
		public function JobsAddPostConvertJob( job : BorhanBatchJob,data : BorhanPostConvertJobData )
		{
			service= 'jobs';
			action= 'addPostConvertJob';

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
			delegate = new JobsAddPostConvertJobDelegate( this , config );
		}
	}
}
