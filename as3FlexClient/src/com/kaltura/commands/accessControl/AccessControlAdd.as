package com.borhan.commands.accessControl
{
	import com.borhan.vo.BorhanAccessControl;
	import com.borhan.delegates.accessControl.AccessControlAddDelegate;
	import com.borhan.net.BorhanCall;

	public class AccessControlAdd extends BorhanCall
	{
		public var filterFields : String;
		public function AccessControlAdd( accessControl : BorhanAccessControl )
		{
			service= 'accesscontrol';
			action= 'add';

			var keyArr : Array = new Array();
			var valueArr : Array = new Array();
			var keyValArr : Array = new Array();
 			keyValArr = borhanObject2Arrays(accessControl,'accessControl');
			keyArr = keyArr.concat( keyValArr[0] );
			valueArr = valueArr.concat( keyValArr[1] );
			applySchema( keyArr , valueArr );
		}

		override public function execute() : void
		{
			setRequestArgument('filterFields',filterFields);
			delegate = new AccessControlAddDelegate( this , config );
		}
	}
}
