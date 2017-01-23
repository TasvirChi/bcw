package com.borhan.commands.notification
{
	import com.borhan.delegates.notification.NotificationGetClientNotificationDelegate;
	import com.borhan.net.BorhanCall;

	public class NotificationGetClientNotification extends BorhanCall
	{
		public var filterFields : String;
		public function NotificationGetClientNotification( entryId : String,type : int )
		{
			service= 'notification';
			action= 'getClientNotification';

			var keyArr : Array = new Array();
			var valueArr : Array = new Array();
			var keyValArr : Array = new Array();
			keyArr.push( 'entryId' );
			valueArr.push( entryId );
			keyArr.push( 'type' );
			valueArr.push( type );
			applySchema( keyArr , valueArr );
		}

		override public function execute() : void
		{
			setRequestArgument('filterFields',filterFields);
			delegate = new NotificationGetClientNotificationDelegate( this , config );
		}
	}
}
