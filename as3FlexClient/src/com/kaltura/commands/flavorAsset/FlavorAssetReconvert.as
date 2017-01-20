package com.borhan.commands.flavorAsset
{
	import com.borhan.delegates.flavorAsset.FlavorAssetReconvertDelegate;
	import com.borhan.net.BorhanCall;

	public class FlavorAssetReconvert extends BorhanCall
	{
		public var filterFields : String;
		public function FlavorAssetReconvert( id : String )
		{
			service= 'flavorasset';
			action= 'reconvert';

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
			delegate = new FlavorAssetReconvertDelegate( this , config );
		}
	}
}
