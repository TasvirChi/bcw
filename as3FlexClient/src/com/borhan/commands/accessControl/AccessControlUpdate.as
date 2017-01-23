package com.borhan.commands.accessControl
{
	import com.borhan.vo.BorhanAccessControl;
	import com.borhan.delegates.accessControl.AccessControlUpdateDelegate;
	import com.borhan.net.BorhanCall;

	public class AccessControlUpdate extends BorhanCall
	{
		public var filterFields : String;
		public function AccessControlUpdate( id : int,accessControl : BorhanAccessControl )
		{
			service= 'accesscontrol';
			action= 'update';

			var keyArr : Array = new Array();
			var valueArr : Array = new Array();
			var keyValArr : Array = new Array();
			keyArr.push( 'id' );
			valueArr.push( id );
 			keyValArr = borhanObject2Arrays(accessControl,'accessControl');
			keyArr = keyArr.concat( keyValArr[0] );
			valueArr = valueArr.concat( keyValArr[1] );
			applySchema( keyArr , valueArr );
		}

		override public function execute() : void
		{
			setRequestArgument('filterFields',filterFields);
			delegate = new AccessControlUpdateDelegate( this , config );
		}
	}
}
