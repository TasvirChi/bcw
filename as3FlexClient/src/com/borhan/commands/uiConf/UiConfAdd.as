package com.borhan.commands.uiConf
{
	import com.borhan.vo.BorhanUiConf;
	import com.borhan.delegates.uiConf.UiConfAddDelegate;
	import com.borhan.net.BorhanCall;

	public class UiConfAdd extends BorhanCall
	{
		public var filterFields : String;
		public function UiConfAdd( uiConf : BorhanUiConf )
		{
			service= 'uiconf';
			action= 'add';

			var keyArr : Array = new Array();
			var valueArr : Array = new Array();
			var keyValArr : Array = new Array();
 			keyValArr = borhanObject2Arrays(uiConf,'uiConf');
			keyArr = keyArr.concat( keyValArr[0] );
			valueArr = valueArr.concat( keyValArr[1] );
			applySchema( keyArr , valueArr );
		}

		override public function execute() : void
		{
			setRequestArgument('filterFields',filterFields);
			delegate = new UiConfAddDelegate( this , config );
		}
	}
}
