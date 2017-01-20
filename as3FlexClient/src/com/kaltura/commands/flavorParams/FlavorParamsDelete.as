package com.borhan.commands.flavorParams
{
	import com.borhan.delegates.flavorParams.FlavorParamsDeleteDelegate;
	import com.borhan.net.BorhanCall;

	public class FlavorParamsDelete extends BorhanCall
	{
		public var filterFields : String;
		public function FlavorParamsDelete( id : int )
		{
			service= 'flavorparams';
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
			delegate = new FlavorParamsDeleteDelegate( this , config );
		}
	}
}
