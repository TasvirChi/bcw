package com.borhan.commands.batchcontrol
{
	import com.borhan.delegates.batchcontrol.BatchcontrolConfigLoadedDelegate;
	import com.borhan.net.BorhanCall;

	public class BatchcontrolConfigLoaded extends BorhanCall
	{
		public var filterFields : String;
		public function BatchcontrolConfigLoaded( schedulerConfigId : int,schedulerName : String,configParam : String,configValue : String,configParamPart : String='',workerConfigId : int=undefined,workerName : String='' )
		{
			service= 'batchcontrol';
			action= 'configLoaded';

			var keyArr : Array = new Array();
			var valueArr : Array = new Array();
			var keyValArr : Array = new Array();
			keyArr.push( 'schedulerConfigId' );
			valueArr.push( schedulerConfigId );
			keyArr.push( 'schedulerName' );
			valueArr.push( schedulerName );
			keyArr.push( 'configParam' );
			valueArr.push( configParam );
			keyArr.push( 'configValue' );
			valueArr.push( configValue );
			keyArr.push( 'configParamPart' );
			valueArr.push( configParamPart );
			keyArr.push( 'workerConfigId' );
			valueArr.push( workerConfigId );
			keyArr.push( 'workerName' );
			valueArr.push( workerName );
			applySchema( keyArr , valueArr );
		}

		override public function execute() : void
		{
			setRequestArgument('filterFields',filterFields);
			delegate = new BatchcontrolConfigLoadedDelegate( this , config );
		}
	}
}
