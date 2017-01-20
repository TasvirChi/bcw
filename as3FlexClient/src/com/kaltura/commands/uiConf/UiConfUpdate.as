package com.borhan.commands.uiConf
{
	import com.borhan.vo.BorhanUiConf;
	import com.borhan.delegates.uiConf.UiConfUpdateDelegate;
	import com.borhan.net.BorhanCall;

	public class UiConfUpdate extends BorhanCall
	{
		public var filterFields : String;
		public function UiConfUpdate( id : int,uiConf : BorhanUiConf )
		{
			service= 'uiconf';
			action= 'update';

			var keyArr : Array = new Array();
			var valueArr : Array = new Array();
			var keyValArr : Array = new Array();
			keyArr.push( 'id' );
			valueArr.push( id );
 			keyValArr = borhanObject2Arrays(uiConf,'uiConf');
			keyArr = keyArr.concat( keyValArr[0] );
			valueArr = valueArr.concat( keyValArr[1] );
			applySchema( keyArr , valueArr );
		}

		override public function execute() : void
		{
			setRequestArgument('filterFields',filterFields);
			delegate = new UiConfUpdateDelegate( this , config );
		}
	}
}
