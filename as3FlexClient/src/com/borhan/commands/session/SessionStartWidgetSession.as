package com.borhan.commands.session
{
	import com.borhan.delegates.session.SessionStartWidgetSessionDelegate;
	import com.borhan.net.BorhanCall;

	public class SessionStartWidgetSession extends BorhanCall
	{
		public var filterFields : String;
		public function SessionStartWidgetSession( widgetId : String,expiry : int=86400 )
		{
			service= 'session';
			action= 'startWidgetSession';

			var keyArr : Array = new Array();
			var valueArr : Array = new Array();
			var keyValArr : Array = new Array();
			keyArr.push( 'widgetId' );
			valueArr.push( widgetId );
			keyArr.push( 'expiry' );
			valueArr.push( expiry );
			applySchema( keyArr , valueArr );
		}

		override public function execute() : void
		{
			setRequestArgument('filterFields',filterFields);
			delegate = new SessionStartWidgetSessionDelegate( this , config );
		}
	}
}
