package com.borhan.commands.storageProfile
{
	import com.borhan.vo.BorhanStorageProfile;
	import com.borhan.delegates.storageProfile.StorageProfileUpdateDelegate;
	import com.borhan.net.BorhanCall;

	public class StorageProfileUpdate extends BorhanCall
	{
		public var filterFields : String;
		public function StorageProfileUpdate( storageProfileId : int,storageProfile : BorhanStorageProfile )
		{
			service= 'storageprofile_storageprofile';
			action= 'update';

			var keyArr : Array = new Array();
			var valueArr : Array = new Array();
			var keyValArr : Array = new Array();
			keyArr.push( 'storageProfileId' );
			valueArr.push( storageProfileId );
 			keyValArr = borhanObject2Arrays(storageProfile,'storageProfile');
			keyArr = keyArr.concat( keyValArr[0] );
			valueArr = valueArr.concat( keyValArr[1] );
			applySchema( keyArr , valueArr );
		}

		override public function execute() : void
		{
			setRequestArgument('filterFields',filterFields);
			delegate = new StorageProfileUpdateDelegate( this , config );
		}
	}
}
