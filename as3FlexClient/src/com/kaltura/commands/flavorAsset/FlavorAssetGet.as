package com.borhan.commands.flavorAsset
{
	import com.borhan.delegates.flavorAsset.FlavorAssetGetDelegate;
	import com.borhan.net.BorhanCall;

	public class FlavorAssetGet extends BorhanCall
	{
		public var filterFields : String;
		public function FlavorAssetGet( id : String )
		{
			service= 'flavorasset';
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
			delegate = new FlavorAssetGetDelegate( this , config );
		}
	}
}
