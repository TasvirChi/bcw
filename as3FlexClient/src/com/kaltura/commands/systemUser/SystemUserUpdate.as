package com.borhan.commands.systemUser
{
	import com.borhan.vo.BorhanSystemUser;
	import com.borhan.delegates.systemUser.SystemUserUpdateDelegate;
	import com.borhan.net.BorhanCall;

	public class SystemUserUpdate extends BorhanCall
	{
		public var filterFields : String;
		public function SystemUserUpdate( userId : int,systemUser : BorhanSystemUser )
		{
			service= 'systemuser_systemuser';
			action= 'update';

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
			delegate = new SystemUserUpdateDelegate( this , config );
		}
	}
}
