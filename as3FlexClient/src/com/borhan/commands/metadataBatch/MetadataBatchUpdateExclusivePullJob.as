package com.borhan.commands.metadataBatch
{
	import com.borhan.vo.BorhanExclusiveLockKey;
	import com.borhan.vo.BorhanBatchJob;
	import com.borhan.delegates.metadataBatch.MetadataBatchUpdateExclusivePullJobDelegate;
	import com.borhan.net.BorhanCall;

	public class MetadataBatchUpdateExclusivePullJob extends BorhanCall
	{
		public var filterFields : String;
		public function MetadataBatchUpdateExclusivePullJob( id : int,lockKey : BorhanExclusiveLockKey,job : BorhanBatchJob )
		{
			service= 'metadata_metadatabatch';
			action= 'updateExclusivePullJob';

			var keyArr : Array = new Array();
			var valueArr : Array = new Array();
			var keyValArr : Array = new Array();
			keyArr.push( 'id' );
			valueArr.push( id );
 			keyValArr = borhanObject2Arrays(lockKey,'lockKey');
			keyArr = keyArr.concat( keyValArr[0] );
			valueArr = valueArr.concat( keyValArr[1] );
 			keyValArr = borhanObject2Arrays(job,'job');
			keyArr = keyArr.concat( keyValArr[0] );
			valueArr = valueArr.concat( keyValArr[1] );
			applySchema( keyArr , valueArr );
		}

		override public function execute() : void
		{
			setRequestArgument('filterFields',filterFields);
			delegate = new MetadataBatchUpdateExclusivePullJobDelegate( this , config );
		}
	}
}
