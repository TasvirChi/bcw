package com.borhan.commands.batchcontrol
{
	import com.borhan.delegates.batchcontrol.BatchcontrolGetCommandDelegate;
	import com.borhan.net.BorhanCall;

	public class BatchcontrolGetCommand extends BorhanCall
	{
		public var filterFields : String;
		public function BatchcontrolGetCommand( commandId : int )
		{
			service= 'batchcontrol';
			action= 'getCommand';

			var keyArr : Array = new Array();
			var valueArr : Array = new Array();
			var keyValArr : Array = new Array();
			keyArr.push( 'commandId' );
			valueArr.push( commandId );
			applySchema( keyArr , valueArr );
		}

		override public function execute() : void
		{
			setRequestArgument('filterFields',filterFields);
			delegate = new BatchcontrolGetCommandDelegate( this , config );
		}
	}
}
