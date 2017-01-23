package com.borhan.commands.systemUser
{
	import com.borhan.vo.BorhanSystemUser;
	import com.borhan.delegates.systemUser.SystemUserAddDelegate;
	import com.borhan.net.BorhanCall;

	public class SystemUserAdd extends BorhanCall
	{
		public var filterFields : String;
		public function SystemUserAdd( systemUser : BorhanSystemUser )
		{
			service= 'systemuser_systemuser';
			action= 'add';

			var keyArr : Array = new Array();
			var valueArr : Array = new Array();
			var keyValArr : Array = new Array();
 			keyValArr = borhanObject2Arrays(systemUser,'systemUser');
			keyArr = keyArr.concat( keyValArr[0] );
			valueArr = valueArr.concat( keyValArr[1] );
			applySchema( keyArr , valueArr );
		}

		override public function execute() : void
		{
			setRequestArgument('filterFields',filterFields);
			delegate = new SystemUserAddDelegate( this , config );
		}
	}
}
