package com.borhan.commands.metadataBatch
{
	import com.borhan.delegates.metadataBatch.MetadataBatchLogConversionDelegate;
	import com.borhan.net.BorhanCall;

	public class MetadataBatchLogConversion extends BorhanCall
	{
		public var filterFields : String;
		public function MetadataBatchLogConversion( flavorAssetId : String,data : String )
		{
			service= 'metadata_metadatabatch';
			action= 'logConversion';

			var keyArr : Array = new Array();
			var valueArr : Array = new Array();
			var keyValArr : Array = new Array();
			keyArr.push( 'flavorAssetId' );
			valueArr.push( flavorAssetId );
			keyArr.push( 'data' );
			valueArr.push( data );
			applySchema( keyArr , valueArr );
		}

		override public function execute() : void
		{
			setRequestArgument('filterFields',filterFields);
			delegate = new MetadataBatchLogConversionDelegate( this , config );
		}
	}
}
