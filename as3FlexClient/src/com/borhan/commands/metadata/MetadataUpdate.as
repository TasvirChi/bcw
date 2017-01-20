package com.borhan.commands.metadata
{
	import com.borhan.delegates.metadata.MetadataUpdateDelegate;
	import com.borhan.net.BorhanCall;

	public class MetadataUpdate extends BorhanCall
	{
		public var filterFields : String;
		public function MetadataUpdate( id : int,xmlData : String='' )
		{
			service= 'metadata_metadata';
			action= 'update';

			var keyArr : Array = new Array();
			var valueArr : Array = new Array();
			var keyValArr : Array = new Array();
			keyArr.push( 'id' );
			valueArr.push( id );
			keyArr.push( 'xmlData' );
			valueArr.push( xmlData );
			applySchema( keyArr , valueArr );
		}

		override public function execute() : void
		{
			setRequestArgument('filterFields',filterFields);
			delegate = new MetadataUpdateDelegate( this , config );
		}
	}
}
