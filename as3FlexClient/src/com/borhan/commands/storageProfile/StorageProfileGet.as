package com.borhan.commands.storageProfile
{
	import com.borhan.delegates.storageProfile.StorageProfileGetDelegate;
	import com.borhan.net.BorhanCall;

	public class StorageProfileGet extends BorhanCall
	{
		public var filterFields : String;
		public function StorageProfileGet( storageProfileId : int )
		{
			service= 'storageprofile_storageprofile';
			action= 'get';

			var keyArr : Array = new Array();
			var valueArr : Array = new Array();
			var keyValArr : Array = new Array();
			keyArr.push( 'storageProfileId' );
			valueArr.push( storageProfileId );
			applySchema( keyArr , valueArr );
		}

		override public function execute() : void
		{
			setRequestArgument('filterFields',filterFields);
			delegate = new StorageProfileGetDelegate( this , config );
		}
	}
}
