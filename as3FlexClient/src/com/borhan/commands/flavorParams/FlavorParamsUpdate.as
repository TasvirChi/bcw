package com.borhan.commands.flavorParams
{
	import com.borhan.vo.BorhanFlavorParams;
	import com.borhan.delegates.flavorParams.FlavorParamsUpdateDelegate;
	import com.borhan.net.BorhanCall;

	public class FlavorParamsUpdate extends BorhanCall
	{
		public var filterFields : String;
		public function FlavorParamsUpdate( id : int,flavorParams : BorhanFlavorParams )
		{
			service= 'flavorparams';
			action= 'update';

			var keyArr : Array = new Array();
			var valueArr : Array = new Array();
			var keyValArr : Array = new Array();
			keyArr.push( 'id' );
			valueArr.push( id );
 			keyValArr = borhanObject2Arrays(flavorParams,'flavorParams');
			keyArr = keyArr.concat( keyValArr[0] );
			valueArr = valueArr.concat( keyValArr[1] );
			applySchema( keyArr , valueArr );
		}

		override public function execute() : void
		{
			setRequestArgument('filterFields',filterFields);
			delegate = new FlavorParamsUpdateDelegate( this , config );
		}
	}
}
