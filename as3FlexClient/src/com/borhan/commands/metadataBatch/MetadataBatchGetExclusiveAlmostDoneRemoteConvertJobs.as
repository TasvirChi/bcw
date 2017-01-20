package com.borhan.commands.metadataBatch
{
	import com.borhan.vo.BorhanExclusiveLockKey;
	import com.borhan.vo.BorhanBatchJobFilter;
	import com.borhan.delegates.metadataBatch.MetadataBatchGetExclusiveAlmostDoneRemoteConvertJobsDelegate;
	import com.borhan.net.BorhanCall;

	public class MetadataBatchGetExclusiveAlmostDoneRemoteConvertJobs extends BorhanCall
	{
		public var filterFields : String;
		public function MetadataBatchGetExclusiveAlmostDoneRemoteConvertJobs( lockKey : BorhanExclusiveLockKey,maxExecutionTime : int,numberOfJobs : int,filter : BorhanBatchJobFilter=null )
		{
			if(filter== null)filter= new BorhanBatchJobFilter();
			service= 'metadata_metadatabatch';
			action= 'getExclusiveAlmostDoneRemoteConvertJobs';

			var keyArr : Array = new Array();
			var valueArr : Array = new Array();
			var keyValArr : Array = new Array();
 			keyValArr = borhanObject2Arrays(lockKey,'lockKey');
			keyArr = keyArr.concat( keyValArr[0] );
			valueArr = valueArr.concat( keyValArr[1] );
			keyArr.push( 'maxExecutionTime' );
			valueArr.push( maxExecutionTime );
			keyArr.push( 'numberOfJobs' );
			valueArr.push( numberOfJobs );
 			keyValArr = borhanObject2Arrays(filter,'filter');
			keyArr = keyArr.concat( keyValArr[0] );
			valueArr = valueArr.concat( keyValArr[1] );
			applySchema( keyArr , valueArr );
		}

		override public function execute() : void
		{
			setRequestArgument('filterFields',filterFields);
			delegate = new MetadataBatchGetExclusiveAlmostDoneRemoteConvertJobsDelegate( this , config );
		}
	}
}
