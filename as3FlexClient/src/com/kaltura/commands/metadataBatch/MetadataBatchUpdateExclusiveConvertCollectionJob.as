package com.borhan.commands.metadataBatch
{
	import com.borhan.vo.BorhanExclusiveLockKey;
	import com.borhan.vo.BorhanBatchJob;
	import com.borhan.delegates.metadataBatch.MetadataBatchUpdateExclusiveConvertCollectionJobDelegate;
	import com.borhan.net.BorhanCall;

	public class MetadataBatchUpdateExclusiveConvertCollectionJob extends BorhanCall
	{
		public var filterFields : String;
		public function MetadataBatchUpdateExclusiveConvertCollectionJob( id : int,lockKey : BorhanExclusiveLockKey,job : BorhanBatchJob,entryStatus : int=undefined,flavorsData : Array=null )
		{
			if(flavorsData== null)flavorsData= new Array();
			service= 'metadata_metadatabatch';
			action= 'updateExclusiveConvertCollectionJob';

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
			keyArr.push( 'entryStatus' );
			valueArr.push( entryStatus );
 			keyValArr = extractArray(flavorsData,'flavorsData');
			keyArr = keyArr.concat( keyValArr[0] );
			valueArr = valueArr.concat( keyValArr[1] );
			applySchema( keyArr , valueArr );
		}

		override public function execute() : void
		{
			setRequestArgument('filterFields',filterFields);
			delegate = new MetadataBatchUpdateExclusiveConvertCollectionJobDelegate( this , config );
		}
	}
}
