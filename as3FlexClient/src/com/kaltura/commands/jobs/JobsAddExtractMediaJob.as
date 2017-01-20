package com.borhan.commands.jobs
{
	import com.borhan.vo.BorhanBatchJob;
	import com.borhan.vo.BorhanExtractMediaJobData;
	import com.borhan.delegates.jobs.JobsAddExtractMediaJobDelegate;
	import com.borhan.net.BorhanCall;

	public class JobsAddExtractMediaJob extends BorhanCall
	{
		public var filterFields : String;
		public function JobsAddExtractMediaJob( job : BorhanBatchJob,extractMediaType : int,data : BorhanExtractMediaJobData )
		{
			service= 'jobs';
			action= 'addExtractMediaJob';

			var keyArr : Array = new Array();
			var valueArr : Array = new Array();
			var keyValArr : Array = new Array();
 			keyValArr = borhanObject2Arrays(job,'job');
			keyArr = keyArr.concat( keyValArr[0] );
			valueArr = valueArr.concat( keyValArr[1] );
			keyArr.push( 'extractMediaType' );
			valueArr.push( extractMediaType );
 			keyValArr = borhanObject2Arrays(data,'data');
			keyArr = keyArr.concat( keyValArr[0] );
			valueArr = valueArr.concat( keyValArr[1] );
			applySchema( keyArr , valueArr );
		}

		override public function execute() : void
		{
			setRequestArgument('filterFields',filterFields);
			delegate = new JobsAddExtractMediaJobDelegate( this , config );
		}
	}
}
