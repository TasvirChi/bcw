package com.borhan.commands.user
{
	import com.borhan.vo.BorhanUser;
	import com.borhan.delegates.user.UserAddDelegate;
	import com.borhan.net.BorhanCall;

	public class UserAdd extends BorhanCall
	{
		public var filterFields : String;
		public function UserAdd( user : BorhanUser )
		{
			service= 'user';
			action= 'add';

			var keyArr : Array = new Array();
			var valueArr : Array = new Array();
			var keyValArr : Array = new Array();
 			keyValArr = borhanObject2Arrays(user,'user');
			keyArr = keyArr.concat( keyValArr[0] );
			valueArr = valueArr.concat( keyValArr[1] );
			applySchema( keyArr , valueArr );
		}

		override public function execute() : void
		{
			setRequestArgument('filterFields',filterFields);
			delegate = new UserAddDelegate( this , config );
		}
	}
}
