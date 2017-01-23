package com.borhan.commands.systemUser
{
	import com.borhan.delegates.systemUser.SystemUserGetByEmailDelegate;
	import com.borhan.net.BorhanCall;

	public class SystemUserGetByEmail extends BorhanCall
	{
		public var filterFields : String;
		public function SystemUserGetByEmail( email : String )
		{
			service= 'systemuser_systemuser';
			action= 'getByEmail';

			var keyArr : Array = new Array();
			var valueArr : Array = new Array();
			var keyValArr : Array = new Array();
			keyArr.push( 'email' );
			valueArr.push( email );
			applySchema( keyArr , valueArr );
		}

		override public function execute() : void
		{
			setRequestArgument('filterFields',filterFields);
			delegate = new SystemUserGetByEmailDelegate( this , config );
		}
	}
}
