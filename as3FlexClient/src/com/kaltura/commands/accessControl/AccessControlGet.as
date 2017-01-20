package com.borhan.commands.accessControl
{
	import com.borhan.delegates.accessControl.AccessControlGetDelegate;
	import com.borhan.net.BorhanCall;

	public class AccessControlGet extends BorhanCall
	{
		public var filterFields : String;
		public function AccessControlGet( id : int )
		{
			service= 'accesscontrol';
			action= 'get';

			var keyArr : Array = new Array();
			var valueArr : Array = new Array();
			var keyValArr : Array = new Array();
			keyArr.push( 'id' );
			valueArr.push( id );
			applySchema( keyArr , valueArr );
		}

		override public function execute() : void
		{
			setRequestArgument('filterFields',filterFields);
			delegate = new AccessControlGetDelegate( this , config );
		}
	}
}
