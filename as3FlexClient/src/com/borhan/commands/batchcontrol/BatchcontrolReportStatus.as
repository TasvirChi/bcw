package com.borhan.commands.batchcontrol
{
	import com.borhan.delegates.batchcontrol.BatchcontrolReportStatusDelegate;
	import com.borhan.net.BorhanCall;

	public class BatchcontrolReportStatus extends BorhanCall
	{
		public var filterFields : String;
		public function BatchcontrolReportStatus( schedulerConfigId : int,schedulerName : String,schedulerStatuses : Array )
		{
			service= 'batchcontrol';
			action= 'reportStatus';

			var keyArr : Array = new Array();
			var valueArr : Array = new Array();
			var keyValArr : Array = new Array();
			keyArr.push( 'schedulerConfigId' );
			valueArr.push( schedulerConfigId );
			keyArr.push( 'schedulerName' );
			valueArr.push( schedulerName );
 			keyValArr = extractArray(schedulerStatuses,'schedulerStatuses');
			keyArr = keyArr.concat( keyValArr[0] );
			valueArr = valueArr.concat( keyValArr[1] );
			applySchema( keyArr , valueArr );
		}

		override public function execute() : void
		{
			setRequestArgument('filterFields',filterFields);
			delegate = new BatchcontrolReportStatusDelegate( this , config );
		}
	}
}
