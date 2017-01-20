package com.borhan.commands.metadataProfile
{
	import com.borhan.vo.BorhanMetadataProfile;
	import com.borhan.vo.File;
	import com.borhan.vo.File;
	import com.borhan.delegates.metadataProfile.MetadataProfileAddFromFileDelegate;
	import com.borhan.net.BorhanCall;

	public class MetadataProfileAddFromFile extends BorhanCall
	{
		public var filterFields : String;
		public function MetadataProfileAddFromFile( metadataProfile : BorhanMetadataProfile,xsdFile : file,viewsFile : file=null )
		{
			if(viewsFile== null)viewsFile= new file();
			service= 'metadata_metadataprofile';
			action= 'addFromFile';

			var keyArr : Array = new Array();
			var valueArr : Array = new Array();
			var keyValArr : Array = new Array();
 			keyValArr = borhanObject2Arrays(metadataProfile,'metadataProfile');
			keyArr = keyArr.concat( keyValArr[0] );
			valueArr = valueArr.concat( keyValArr[1] );
 			keyValArr = borhanObject2Arrays(xsdFile,'xsdFile');
			keyArr = keyArr.concat( keyValArr[0] );
			valueArr = valueArr.concat( keyValArr[1] );
 			keyValArr = borhanObject2Arrays(viewsFile,'viewsFile');
			keyArr = keyArr.concat( keyValArr[0] );
			valueArr = valueArr.concat( keyValArr[1] );
			applySchema( keyArr , valueArr );
		}

		override public function execute() : void
		{
			setRequestArgument('filterFields',filterFields);
			delegate = new MetadataProfileAddFromFileDelegate( this , config );
		}
	}
}
