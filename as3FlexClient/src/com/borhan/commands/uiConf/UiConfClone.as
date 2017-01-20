package com.borhan.commands.uiConf
{
	import com.borhan.delegates.uiConf.UiConfCloneDelegate;
	import com.borhan.net.BorhanCall;

	public class UiConfClone extends BorhanCall
	{
		public var filterFields : String;
		public function UiConfClone( id : int )
		{
			service= 'uiconf';
			action= 'clone';

			var keyArr : Array = new Array();
			var valueArr : Array = new Array();
			var keyValArr : Array = new Array();
			keyArr.push( 'id' );
			valueArr.push( id );
			applySchema( keyArr , valueArr );
		}

		override public function execute() : void
		{
			setRequestArgument('filterFields',filterFields);
			delegate = new UiConfCloneDelegate( this , config );
		}
	}
}
