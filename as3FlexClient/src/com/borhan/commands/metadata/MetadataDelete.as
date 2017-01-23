package com.borhan.commands.metadata
{
	import com.borhan.delegates.metadata.MetadataDeleteDelegate;
	import com.borhan.net.BorhanCall;

	public class MetadataDelete extends BorhanCall
	{
		public var filterFields : String;
		public function MetadataDelete( id : int )
		{
			service= 'metadata_metadata';
			action= 'delete';

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
			delegate = new MetadataDeleteDelegate( this , config );
		}
	}
}
