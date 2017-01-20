package com.borhan.commands.flavorAsset
{
	import com.borhan.delegates.flavorAsset.FlavorAssetConvertDelegate;
	import com.borhan.net.BorhanCall;

	public class FlavorAssetConvert extends BorhanCall
	{
		public var filterFields : String;
		public function FlavorAssetConvert( entryId : String,flavorParamsId : int )
		{
			service= 'flavorasset';
			action= 'convert';

			var keyArr : Array = new Array();
			var valueArr : Array = new Array();
			var keyValArr : Array = new Array();
			keyArr.push( 'entryId' );
			valueArr.push( entryId );
			keyArr.push( 'flavorParamsId' );
			valueArr.push( flavorParamsId );
			applySchema( keyArr , valueArr );
		}

		override public function execute() : void
		{
			setRequestArgument('filterFields',filterFields);
			delegate = new FlavorAssetConvertDelegate( this , config );
		}
	}
}
