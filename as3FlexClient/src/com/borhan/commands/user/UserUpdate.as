package com.borhan.commands.user
{
	import com.borhan.vo.BorhanUser;
	import com.borhan.delegates.user.UserUpdateDelegate;
	import com.borhan.net.BorhanCall;

	public class UserUpdate extends BorhanCall
	{
		public var filterFields : String;
		public function UserUpdate( userId : String,user : BorhanUser )
		{
			service= 'user';
			action= 'update';

			var keyArr : Array = new Array();
			var valueArr : Array = new Array();
			var keyValArr : Array = new Array();
			keyArr.push( 'userId' );
			valueArr.push( userId );
 			keyValArr = borhanObject2Arrays(user,'user');
			keyArr = keyArr.concat( keyValArr[0] );
			valueArr = valueArr.concat( keyValArr[1] );
			applySchema( keyArr , valueArr );
		}

		override public function execute() : void
		{
			setRequestArgument('filterFields',filterFields);
			delegate = new UserUpdateDelegate( this , config );
		}
	}
}
