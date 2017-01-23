package com.borhan.commands.systemUser
{
	import com.borhan.delegates.systemUser.SystemUserGetDelegate;
	import com.borhan.net.BorhanCall;

	public class SystemUserGet extends BorhanCall
	{
		public var filterFields : String;
		public function SystemUserGet( userId : int )
		{
			service= 'systemuser_systemuser';
			action= 'get';

			var keyArr : Array = new Array();
			var valueArr : Array = new Array();
			var keyValArr : Array = new Array();
			keyArr.push( 'userId' );
			valueArr.push( userId );
			applySchema( keyArr , valueArr );
		}

		override public function execute() : void
		{
			setRequestArgument('filterFields',filterFields);
			delegate = new SystemUserGetDelegate( this , config );
		}
	}
}
