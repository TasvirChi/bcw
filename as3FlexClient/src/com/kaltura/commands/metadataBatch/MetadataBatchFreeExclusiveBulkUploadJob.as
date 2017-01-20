package com.borhan.commands.metadataBatch
{
	import com.borhan.vo.BorhanExclusiveLockKey;
	import com.borhan.delegates.metadataBatch.MetadataBatchFreeExclusiveBulkUploadJobDelegate;
	import com.borhan.net.BorhanCall;

	public class MetadataBatchFreeExclusiveBulkUploadJob extends BorhanCall
	{
		public var filterFields : String;
		public function MetadataBatchFreeExclusiveBulkUploadJob( id : int,lockKey : BorhanExclusiveLockKey,resetExecutionAttempts : Boolean=false )
		{
			service= 'metadata_metadatabatch';
			action= 'freeExclusiveBulkUploadJob';

			var keyArr : Array = new Array();
			var valueArr : Array = new Array();
			var keyValArr : Array = new Array();
			keyArr.push( 'id' );
			valueArr.push( id );
 			keyValArr = borhanObject2Arrays(lockKey,'lockKey');
			keyArr = keyArr.concat( keyValArr[0] );
			valueArr = valueArr.concat( keyValArr[1] );
			keyArr.push( 'resetExecutionAttempts' );
			valueArr.push( resetExecutionAttempts );
			applySchema( keyArr , valueArr );
		}

		override public function execute() : void
		{
			setRequestArgument('filterFields',filterFields);
			delegate = new MetadataBatchFreeExclusiveBulkUploadJobDelegate( this , config );
		}
	}
}
