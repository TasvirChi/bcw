package com.borhan.commands.adminUser
{
	import com.borhan.delegates.adminUser.AdminUserResetPasswordDelegate;
	import com.borhan.net.BorhanCall;

	public class AdminUserResetPassword extends BorhanCall
	{
		public var filterFields : String;
		public function AdminUserResetPassword( email : String )
		{
			service= 'adminuser';
			action= 'resetPassword';

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
			delegate = new AdminUserResetPasswordDelegate( this , config );
		}
	}
}
