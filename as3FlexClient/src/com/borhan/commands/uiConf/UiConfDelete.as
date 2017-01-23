package com.borhan.commands.uiConf
{
	import com.borhan.delegates.uiConf.UiConfDeleteDelegate;
	import com.borhan.net.BorhanCall;

	public class UiConfDelete extends BorhanCall
	{
		public var filterFields : String;
		public function UiConfDelete( id : int )
		{
			service= 'uiconf';
			action= 'delete';

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
			delegate = new UiConfDeleteDelegate( this , config );
		}
	}
}
