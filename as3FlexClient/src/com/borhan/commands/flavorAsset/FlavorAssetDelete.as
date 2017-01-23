package com.borhan.commands.flavorAsset
{
	import com.borhan.delegates.flavorAsset.FlavorAssetDeleteDelegate;
	import com.borhan.net.BorhanCall;

	public class FlavorAssetDelete extends BorhanCall
	{
		public var filterFields : String;
		public function FlavorAssetDelete( id : String )
		{
			service= 'flavorasset';
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
			delegate = new FlavorAssetDeleteDelegate( this , config );
		}
	}
}
