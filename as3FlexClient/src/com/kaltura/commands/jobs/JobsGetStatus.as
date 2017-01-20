package com.borhan.commands.jobs
{
	import com.borhan.delegates.jobs.JobsGetStatusDelegate;
	import com.borhan.net.BorhanCall;

	public class JobsGetStatus extends BorhanCall
	{
		public var filterFields : String;
		public function JobsGetStatus( job_id : int )
		{
			service= 'jobs';
			action= 'getStatus';

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
			delegate = new JobsGetStatusDelegate( this , config );
		}
	}
}
