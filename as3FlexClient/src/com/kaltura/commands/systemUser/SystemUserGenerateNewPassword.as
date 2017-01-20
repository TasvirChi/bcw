package com.borhan.commands.systemUser
{
	import com.borhan.delegates.systemUser.SystemUserGenerateNewPasswordDelegate;
	import com.borhan.net.BorhanCall;

	public class SystemUserGenerateNewPassword extends BorhanCall
	{
		public var filterFields : String;
		public function SystemUserGenerateNewPassword(  )
		{
			service= 'systemuser_systemuser';
			action= 'generateNewPassword';

			var keyArr : Array = new Array();
			var valueArr : Array = new Array();
			var keyValArr : Array = new Array();
			applySchema( keyArr , valueArr );
		}

		override public function execute() : void
		{
			setRequestArgument('filterFields',filterFields);
			delegate = new SystemUserGenerateNewPasswordDelegate( this , config );
		}
	}
}
