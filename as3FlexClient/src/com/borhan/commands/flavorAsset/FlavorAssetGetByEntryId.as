package com.borhan.commands.flavorAsset
{
	import com.borhan.delegates.flavorAsset.FlavorAssetGetByEntryIdDelegate;
	import com.borhan.net.BorhanCall;

	public class FlavorAssetGetByEntryId extends BorhanCall
	{
		public var filterFields : String;
		public function FlavorAssetGetByEntryId( entryId : String )
		{
			service= 'flavorasset';
			action= 'getByEntryId';

			var keyArr : Array = new Array();
			var valueArr : Array = new Array();
			var keyValArr : Array = new Array();
			keyArr.push( 'entryId' );
			valueArr.push( entryId );
			applySchema( keyArr , valueArr );
		}

		override public function execute() : void
		{
			setRequestArgument('filterFields',filterFields);
			delegate = new FlavorAssetGetByEntryIdDelegate( this , config );
		}
	}
}
