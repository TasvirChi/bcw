package com.borhan.commands.jobs
{
	import com.borhan.delegates.jobs.JobsGetConvertStatusDelegate;
	import com.borhan.net.BorhanCall;

	public class JobsGetConvertStatus extends BorhanCall
	{
		public var filterFields : String;
		public function JobsGetConvertStatus( job_id : int )
		{
			service= 'jobs';
			action= 'getConvertStatus';

			var keyArr : Array = new Array();
			var valueArr : Array = new Array();
			var keyValArr : Array = new Array();
			keyArr.push( 'job_id' );
			valueArr.push( job_id );
			applySchema( keyArr , valueArr );
		}

		override public function execute() : void
		{
			setRequestArgument('filterFields',filterFields);
			delegate = new JobsGetConvertStatusDelegate( this , config );
		}
	}
}
