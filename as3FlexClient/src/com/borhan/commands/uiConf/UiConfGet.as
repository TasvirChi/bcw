package com.borhan.commands.uiConf
{
	import com.borhan.delegates.uiConf.UiConfGetDelegate;
	import com.borhan.net.BorhanCall;

	public class UiConfGet extends BorhanCall
	{
		public var filterFields : String;
		public function UiConfGet( id : int )
		{
			service= 'uiconf';
			action= 'get';

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
			delegate = new UiConfGetDelegate( this , config );
		}
	}
}
