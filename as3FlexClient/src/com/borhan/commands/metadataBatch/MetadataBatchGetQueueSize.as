package com.borhan.commands.metadataBatch
{
	import com.borhan.vo.BorhanWorkerQueueFilter;
	import com.borhan.delegates.metadataBatch.MetadataBatchGetQueueSizeDelegate;
	import com.borhan.net.BorhanCall;

	public class MetadataBatchGetQueueSize extends BorhanCall
	{
		public var filterFields : String;
		public function MetadataBatchGetQueueSize( workerQueueFilter : BorhanWorkerQueueFilter )
		{
			service= 'metadata_metadatabatch';
			action= 'getQueueSize';

			var keyArr : Array = new Array();
			var valueArr : Array = new Array();
			var keyValArr : Array = new Array();
 			keyValArr = borhanObject2Arrays(workerQueueFilter,'workerQueueFilter');
			keyArr = keyArr.concat( keyValArr[0] );
			valueArr = valueArr.concat( keyValArr[1] );
			applySchema( keyArr , valueArr );
		}

		override public function execute() : void
		{
			setRequestArgument('filterFields',filterFields);
			delegate = new MetadataBatchGetQueueSizeDelegate( this , config );
		}
	}
}
