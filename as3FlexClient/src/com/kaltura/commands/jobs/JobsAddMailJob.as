package com.borhan.commands.jobs
{
	import com.borhan.vo.BorhanMailJob;
	import com.borhan.delegates.jobs.JobsAddMailJobDelegate;
	import com.borhan.net.BorhanCall;

	public class JobsAddMailJob extends BorhanCall
	{
		public var filterFields : String;
		public function JobsAddMailJob( mailJob : BorhanMailJob )
		{
			service= 'jobs';
			action= 'addMailJob';

			var keyArr : Array = new Array();
			var valueArr : Array = new Array();
			var keyValArr : Array = new Array();
 			keyValArr = borhanObject2Arrays(mailJob,'mailJob');
			keyArr = keyArr.concat( keyValArr[0] );
			valueArr = valueArr.concat( keyValArr[1] );
			applySchema( keyArr , valueArr );
		}

		override public function execute() : void
		{
			setRequestArgument('filterFields',filterFields);
			delegate = new JobsAddMailJobDelegate( this , config );
		}
	}
}
