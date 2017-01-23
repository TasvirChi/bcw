package com.borhan.commands.system
{
	import com.borhan.vo.BorhanSystemUser;
	import com.borhan.delegates.system.SystemUpdateUserDelegate;
	import com.borhan.net.BorhanCall;

	public class SystemUpdateUser extends BorhanCall
	{
		public var filterFields : String;
		public function SystemUpdateUser( userId : int,systemUser : BorhanSystemUser )
		{
			service= 'system';
			action= 'updateUser';

			var keyArr : Array = new Array();
			var valueArr : Array = new Array();
			var keyValArr : Array = new Array();
			keyArr.push( 'userId' );
			valueArr.push( userId );
 			keyValArr = borhanObject2Arrays(systemUser,'systemUser');
			keyArr = keyArr.concat( keyValArr[0] );
			valueArr = valueArr.concat( keyValArr[1] );
			applySchema( keyArr , valueArr );
		}

		override public function execute() : void
		{
			setRequestArgument('filterFields',filterFields);
			delegate = new SystemUpdateUserDelegate( this , config );
		}
	}
}
