package com.borhan.commands.accessControl
{
	import com.borhan.delegates.accessControl.AccessControlDeleteDelegate;
	import com.borhan.net.BorhanCall;

	public class AccessControlDelete extends BorhanCall
	{
		public var filterFields : String;
		public function AccessControlDelete( id : int )
		{
			service= 'accesscontrol';
			action= 'delete';

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
			delegate = new AccessControlDeleteDelegate( this , config );
		}
	}
}
