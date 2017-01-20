package com.borhan.commands.jobs
{
	import com.borhan.vo.BorhanNotification;
	import com.borhan.delegates.jobs.JobsCreateNotificationDelegate;
	import com.borhan.net.BorhanCall;

	public class JobsCreateNotification extends BorhanCall
	{
		public var filterFields : String;
		public function JobsCreateNotification( notificationJob : BorhanNotification )
		{
			service= 'jobs';
			action= 'createNotification';

			var keyArr : Array = new Array();
			var valueArr : Array = new Array();
			var keyValArr : Array = new Array();
 			keyValArr = borhanObject2Arrays(notificationJob,'notificationJob');
			keyArr = keyArr.concat( keyValArr[0] );
			valueArr = valueArr.concat( keyValArr[1] );
			applySchema( keyArr , valueArr );
		}

		override public function execute() : void
		{
			setRequestArgument('filterFields',filterFields);
			delegate = new JobsCreateNotificationDelegate( this , config );
		}
	}
}
