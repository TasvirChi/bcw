package com.borhan.commands.jobs
{
	import com.borhan.vo.BorhanBatchJob;
	import com.borhan.vo.BorhanBulkUploadJobData;
	import com.borhan.vo.File;
	import com.borhan.delegates.jobs.JobsAddBulkUploadJobDelegate;
	import com.borhan.net.BorhanCall;

	public class JobsAddBulkUploadJob extends BorhanCall
	{
		public var filterFields : String;
		public function JobsAddBulkUploadJob( job : BorhanBatchJob,data : BorhanBulkUploadJobData,csvFileData : file )
		{
			service= 'jobs';
			action= 'addBulkUploadJob';

			var keyArr : Array = new Array();
			var valueArr : Array = new Array();
			var keyValArr : Array = new Array();
 			keyValArr = borhanObject2Arrays(job,'job');
			keyArr = keyArr.concat( keyValArr[0] );
			valueArr = valueArr.concat( keyValArr[1] );
 			keyValArr = borhanObject2Arrays(data,'data');
			keyArr = keyArr.concat( keyValArr[0] );
			valueArr = valueArr.concat( keyValArr[1] );
 			keyValArr = borhanObject2Arrays(csvFileData,'csvFileData');
			keyArr = keyArr.concat( keyValArr[0] );
			valueArr = valueArr.concat( keyValArr[1] );
			applySchema( keyArr , valueArr );
		}

		override public function execute() : void
		{
			setRequestArgument('filterFields',filterFields);
			delegate = new JobsAddBulkUploadJobDelegate( this , config );
		}
	}
}
