package com.borhan.commands.metadataProfile
{
	import com.borhan.vo.File;
	import com.borhan.delegates.metadataProfile.MetadataProfileUpdateDefinitionFromFileDelegate;
	import com.borhan.net.BorhanCall;

	public class MetadataProfileUpdateDefinitionFromFile extends BorhanCall
	{
		public var filterFields : String;
		public function MetadataProfileUpdateDefinitionFromFile( id : int,xsdFile : file )
		{
			service= 'metadata_metadataprofile';
			action= 'updateDefinitionFromFile';

			var keyArr : Array = new Array();
			var valueArr : Array = new Array();
			var keyValArr : Array = new Array();
			keyArr.push( 'id' );
			valueArr.push( id );
 			keyValArr = borhanObject2Arrays(xsdFile,'xsdFile');
			keyArr = keyArr.concat( keyValArr[0] );
			valueArr = valueArr.concat( keyValArr[1] );
			applySchema( keyArr , valueArr );
		}

		override public function execute() : void
		{
			setRequestArgument('filterFields',filterFields);
			delegate = new MetadataProfileUpdateDefinitionFromFileDelegate( this , config );
		}
	}
}
