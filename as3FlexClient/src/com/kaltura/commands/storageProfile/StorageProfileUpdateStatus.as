package com.borhan.commands.storageProfile
{
	import com.borhan.delegates.storageProfile.StorageProfileUpdateStatusDelegate;
	import com.borhan.net.BorhanCall;

	public class StorageProfileUpdateStatus extends BorhanCall
	{
		public var filterFields : String;
		public function StorageProfileUpdateStatus( storageId : int,status : int )
		{
			service= 'storageprofile_storageprofile';
			action= 'updateStatus';

			var keyArr : Array = new Array();
			var valueArr : Array = new Array();
			var keyValArr : Array = new Array();
			keyArr.push( 'storageId' );
			valueArr.push( storageId );
			keyArr.push( 'status' );
			valueArr.push( status );
			applySchema( keyArr , valueArr );
		}

		override public function execute() : void
		{
			setRequestArgument('filterFields',filterFields);
			delegate = new StorageProfileUpdateStatusDelegate( this , config );
		}
	}
}
