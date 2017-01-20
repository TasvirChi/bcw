package com.borhan.commands.flavorAsset
{
	import com.borhan.delegates.flavorAsset.FlavorAssetGetDownloadUrlDelegate;
	import com.borhan.net.BorhanCall;

	public class FlavorAssetGetDownloadUrl extends BorhanCall
	{
		public var filterFields : String;
		public function FlavorAssetGetDownloadUrl( id : String )
		{
			service= 'flavorasset';
			action= 'getDownloadUrl';

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
			delegate = new FlavorAssetGetDownloadUrlDelegate( this , config );
		}
	}
}
