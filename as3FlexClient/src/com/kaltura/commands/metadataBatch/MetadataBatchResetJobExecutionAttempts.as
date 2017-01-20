package com.borhan.commands.metadataBatch
{
	import com.borhan.vo.BorhanExclusiveLockKey;
	import com.borhan.delegates.metadataBatch.MetadataBatchResetJobExecutionAttemptsDelegate;
	import com.borhan.net.BorhanCall;

	public class MetadataBatchResetJobExecutionAttempts extends BorhanCall
	{
		public var filterFields : String;
		public function MetadataBatchResetJobExecutionAttempts( id : int,lockKey : BorhanExclusiveLockKey,jobType : int )
		{
			service= 'metadata_metadatabatch';
			action= 'resetJobExecutionAttempts';

			var keyArr : Array = new Array();
			var valueArr : Array = new Array();
			var keyValArr : Array = new Array();
			keyArr.push( 'id' );
			valueArr.push( id );
 			keyValArr = borhanObject2Arrays(lockKey,'lockKey');
			keyArr = keyArr.concat( keyValArr[0] );
			valueArr = valueArr.concat( keyValArr[1] );
			keyArr.push( 'jobType' );
			valueArr.push( jobType );
			applySchema( keyArr , valueArr );
		}

		override public function execute() : void
		{
			setRequestArgument('filterFields',filterFields);
			delegate = new MetadataBatchResetJobExecutionAttemptsDelegate( this , config );
		}
	}
}
