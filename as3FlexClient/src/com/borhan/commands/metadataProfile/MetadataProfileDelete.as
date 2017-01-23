package com.borhan.commands.metadataProfile
{
	import com.borhan.delegates.metadataProfile.MetadataProfileDeleteDelegate;
	import com.borhan.net.BorhanCall;

	public class MetadataProfileDelete extends BorhanCall
	{
		public var filterFields : String;
		public function MetadataProfileDelete( id : int )
		{
			service= 'metadata_metadataprofile';
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
			delegate = new MetadataProfileDeleteDelegate( this , config );
		}
	}
}
