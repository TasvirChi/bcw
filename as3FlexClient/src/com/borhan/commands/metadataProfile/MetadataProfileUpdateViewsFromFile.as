package com.borhan.commands.metadataProfile
{
	import com.borhan.vo.File;
	import com.borhan.delegates.metadataProfile.MetadataProfileUpdateViewsFromFileDelegate;
	import com.borhan.net.BorhanCall;

	public class MetadataProfileUpdateViewsFromFile extends BorhanCall
	{
		public var filterFields : String;
		public function MetadataProfileUpdateViewsFromFile( id : int,viewsFile : file )
		{
			service= 'metadata_metadataprofile';
			action= 'updateViewsFromFile';

			var keyArr : Array = new Array();
			var valueArr : Array = new Array();
			var keyValArr : Array = new Array();
			keyArr.push( 'id' );
			valueArr.push( id );
 			keyValArr = borhanObject2Arrays(viewsFile,'viewsFile');
			keyArr = keyArr.concat( keyValArr[0] );
			valueArr = valueArr.concat( keyValArr[1] );
			applySchema( keyArr , valueArr );
		}

		override public function execute() : void
		{
			setRequestArgument('filterFields',filterFields);
			delegate = new MetadataProfileUpdateViewsFromFileDelegate( this , config );
		}
	}
}
