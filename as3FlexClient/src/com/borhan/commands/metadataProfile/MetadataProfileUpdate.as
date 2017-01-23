package com.borhan.commands.metadataProfile
{
	import com.borhan.vo.BorhanMetadataProfile;
	import com.borhan.delegates.metadataProfile.MetadataProfileUpdateDelegate;
	import com.borhan.net.BorhanCall;

	public class MetadataProfileUpdate extends BorhanCall
	{
		public var filterFields : String;
		public function MetadataProfileUpdate( id : int,metadataProfile : BorhanMetadataProfile,xsdData : String='',viewsData : String='' )
		{
			service= 'metadata_metadataprofile';
			action= 'update';

			var keyArr : Array = new Array();
			var valueArr : Array = new Array();
			var keyValArr : Array = new Array();
			keyArr.push( 'id' );
			valueArr.push( id );
 			keyValArr = borhanObject2Arrays(metadataProfile,'metadataProfile');
			keyArr = keyArr.concat( keyValArr[0] );
			valueArr = valueArr.concat( keyValArr[1] );
			keyArr.push( 'xsdData' );
			valueArr.push( xsdData );
			keyArr.push( 'viewsData' );
			valueArr.push( viewsData );
			applySchema( keyArr , valueArr );
		}

		override public function execute() : void
		{
			setRequestArgument('filterFields',filterFields);
			delegate = new MetadataProfileUpdateDelegate( this , config );
		}
	}
}
