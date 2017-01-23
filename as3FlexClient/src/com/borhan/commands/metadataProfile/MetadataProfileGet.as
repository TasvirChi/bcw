package com.borhan.commands.metadataProfile
{
	import com.borhan.delegates.metadataProfile.MetadataProfileGetDelegate;
	import com.borhan.net.BorhanCall;

	public class MetadataProfileGet extends BorhanCall
	{
		public var filterFields : String;
		public function MetadataProfileGet( id : int )
		{
			service= 'metadata_metadataprofile';
			action= 'get';

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
			delegate = new MetadataProfileGetDelegate( this , config );
		}
	}
}
