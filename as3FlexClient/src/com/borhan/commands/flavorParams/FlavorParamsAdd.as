package com.borhan.commands.flavorParams
{
	import com.borhan.vo.BorhanFlavorParams;
	import com.borhan.delegates.flavorParams.FlavorParamsAddDelegate;
	import com.borhan.net.BorhanCall;

	public class FlavorParamsAdd extends BorhanCall
	{
		public var filterFields : String;
		public function FlavorParamsAdd( flavorParams : BorhanFlavorParams )
		{
			service= 'flavorparams';
			action= 'add';

			var keyArr : Array = new Array();
			var valueArr : Array = new Array();
			var keyValArr : Array = new Array();
 			keyValArr = borhanObject2Arrays(flavorParams,'flavorParams');
			keyArr = keyArr.concat( keyValArr[0] );
			valueArr = valueArr.concat( keyValArr[1] );
			applySchema( keyArr , valueArr );
		}

		override public function execute() : void
		{
			setRequestArgument('filterFields',filterFields);
			delegate = new FlavorParamsAddDelegate( this , config );
		}
	}
}
