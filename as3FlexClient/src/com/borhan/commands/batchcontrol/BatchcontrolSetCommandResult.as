package com.borhan.commands.batchcontrol
{
	import com.borhan.delegates.batchcontrol.BatchcontrolSetCommandResultDelegate;
	import com.borhan.net.BorhanCall;

	public class BatchcontrolSetCommandResult extends BorhanCall
	{
		public var filterFields : String;
		public function BatchcontrolSetCommandResult( commandId : int,status : int,error_description : String='' )
		{
			service= 'batchcontrol';
			action= 'setCommandResult';

			var keyArr : Array = new Array();
			var valueArr : Array = new Array();
			var keyValArr : Array = new Array();
			keyArr.push( 'commandId' );
			valueArr.push( commandId );
			keyArr.push( 'status' );
			valueArr.push( status );
			keyArr.push( 'error_description' );
			valueArr.push( error_description );
			applySchema( keyArr , valueArr );
		}

		override public function execute() : void
		{
			setRequestArgument('filterFields',filterFields);
			delegate = new BatchcontrolSetCommandResultDelegate( this , config );
		}
	}
}
