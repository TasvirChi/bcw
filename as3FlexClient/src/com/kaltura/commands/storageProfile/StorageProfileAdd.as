package com.borhan.commands.storageProfile
{
	import com.borhan.vo.BorhanStorageProfile;
	import com.borhan.delegates.storageProfile.StorageProfileAddDelegate;
	import com.borhan.net.BorhanCall;

	public class StorageProfileAdd extends BorhanCall
	{
		public var filterFields : String;
		public function StorageProfileAdd( storageProfile : BorhanStorageProfile )
		{
			service= 'storageprofile_storageprofile';
			action= 'add';

			var keyArr : Array = new Array();
			var valueArr : Array = new Array();
			var keyValArr : Array = new Array();
 			keyValArr = borhanObject2Arrays(storageProfile,'storageProfile');
			keyArr = keyArr.concat( keyValArr[0] );
			valueArr = valueArr.concat( keyValArr[1] );
			applySchema( keyArr , valueArr );
		}

		override public function execute() : void
		{
			setRequestArgument('filterFields',filterFields);
			delegate = new StorageProfileAddDelegate( this , config );
		}
	}
}
