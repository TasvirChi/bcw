package com.borhan.commands.metadata
{
	import com.borhan.vo.File;
	import com.borhan.delegates.metadata.MetadataUpdateFromFileDelegate;
	import com.borhan.net.BorhanCall;

	public class MetadataUpdateFromFile extends BorhanCall
	{
		public var filterFields : String;
		public function MetadataUpdateFromFile( id : int,xmlFile : file=null )
		{
			if(xmlFile== null)xmlFile= new file();
			service= 'metadata_metadata';
			action= 'updateFromFile';

			var keyArr : Array = new Array();
			var valueArr : Array = new Array();
			var keyValArr : Array = new Array();
			keyArr.push( 'id' );
			valueArr.push( id );
 			keyValArr = borhanObject2Arrays(xmlFile,'xmlFile');
			keyArr = keyArr.concat( keyValArr[0] );
			valueArr = valueArr.concat( keyValArr[1] );
			applySchema( keyArr , valueArr );
		}

		override public function execute() : void
		{
			setRequestArgument('filterFields',filterFields);
			delegate = new MetadataUpdateFromFileDelegate( this , config );
		}
	}
}
