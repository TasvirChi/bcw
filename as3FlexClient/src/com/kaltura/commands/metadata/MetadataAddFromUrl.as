package com.borhan.commands.metadata
{
	import com.borhan.delegates.metadata.MetadataAddFromUrlDelegate;
	import com.borhan.net.BorhanCall;

	public class MetadataAddFromUrl extends BorhanCall
	{
		public var filterFields : String;
		public function MetadataAddFromUrl( metadataProfileId : int,objectType : int,objectId : String,url : String )
		{
			service= 'metadata_metadata';
			action= 'addFromUrl';

			var keyArr : Array = new Array();
			var valueArr : Array = new Array();
			var keyValArr : Array = new Array();
			keyArr.push( 'metadataProfileId' );
			valueArr.push( metadataProfileId );
			keyArr.push( 'objectType' );
			valueArr.push( objectType );
			keyArr.push( 'objectId' );
			valueArr.push( objectId );
			keyArr.push( 'url' );
			valueArr.push( url );
			applySchema( keyArr , valueArr );
		}

		override public function execute() : void
		{
			setRequestArgument('filterFields',filterFields);
			delegate = new MetadataAddFromUrlDelegate( this , config );
		}
	}
}
