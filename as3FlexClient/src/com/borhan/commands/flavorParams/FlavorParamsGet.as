package com.borhan.commands.flavorParams
{
	import com.borhan.delegates.flavorParams.FlavorParamsGetDelegate;
	import com.borhan.net.BorhanCall;

	public class FlavorParamsGet extends BorhanCall
	{
		public var filterFields : String;
		public function FlavorParamsGet( id : int )
		{
			service= 'flavorparams';
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
			delegate = new FlavorParamsGetDelegate( this , config );
		}
	}
}
