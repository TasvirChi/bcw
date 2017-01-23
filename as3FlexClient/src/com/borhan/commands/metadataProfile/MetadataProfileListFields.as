package com.borhan.commands.metadataProfile
{
	import com.borhan.delegates.metadataProfile.MetadataProfileListFieldsDelegate;
	import com.borhan.net.BorhanCall;

	public class MetadataProfileListFields extends BorhanCall
	{
		public var filterFields : String;
		public function MetadataProfileListFields( metadataProfileId : int )
		{
			service= 'metadata_metadataprofile';
			action= 'listFields';

			var keyArr : Array = new Array();
			var valueArr : Array = new Array();
			var keyValArr : Array = new Array();
			keyArr.push( 'metadataProfileId' );
			valueArr.push( metadataProfileId );
			applySchema( keyArr , valueArr );
		}

		override public function execute() : void
		{
			setRequestArgument('filterFields',filterFields);
			delegate = new MetadataProfileListFieldsDelegate( this , config );
		}
	}
}
