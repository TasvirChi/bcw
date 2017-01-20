package com.borhan.commands.system
{
	import com.borhan.vo.BorhanSystemUser;
	import com.borhan.delegates.system.SystemAddUserDelegate;
	import com.borhan.net.BorhanCall;

	public class SystemAddUser extends BorhanCall
	{
		public var filterFields : String;
		public function SystemAddUser( systemUser : BorhanSystemUser )
		{
			service= 'system';
			action= 'addUser';

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
			delegate = new SystemAddUserDelegate( this , config );
		}
	}
}
