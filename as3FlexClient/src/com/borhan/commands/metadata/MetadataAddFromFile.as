package com.borhan.commands.metadata
{
	import com.borhan.vo.File;
	import com.borhan.delegates.metadata.MetadataAddFromFileDelegate;
	import com.borhan.net.BorhanCall;

	public class MetadataAddFromFile extends BorhanCall
	{
		public var filterFields : String;
		public function MetadataAddFromFile( metadataProfileId : int,objectType : int,objectId : String,xmlFile : file )
		{
			service= 'metadata_metadata';
			action= 'addFromFile';

			var keyArr : Array = new Array();
			var valueArr : Array = new Array();
			var keyValArr : Array = new Array();
			keyArr.push( 'metadataProfileId' );
			valueArr.push( metadataProfileId );
			keyArr.push( 'objectType' );
			valueArr.push( objectType );
			keyArr.push( 'objectId' );
			valueArr.push( objectId );
 			keyValArr = borhanObject2Arrays(xmlFile,'xmlFile');
			keyArr = keyArr.concat( keyValArr[0] );
			valueArr = valueArr.concat( keyValArr[1] );
			applySchema( keyArr , valueArr );
		}

		override public function execute() : void
		{
			setRequestArgument('filterFields',filterFields);
			delegate = new MetadataAddFromFileDelegate( this , config );
		}
	}
}
