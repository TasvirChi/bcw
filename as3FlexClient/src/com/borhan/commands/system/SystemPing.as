package com.borhan.commands.system
{
	import com.borhan.delegates.system.SystemPingDelegate;
	import com.borhan.net.BorhanCall;

	public class SystemPing extends BorhanCall
	{
		public var filterFields : String;
		public function SystemPing(  )
		{
			service= 'system';
			action= 'ping';

			var keyArr : Array = new Array();
			var valueArr : Array = new Array();
			var keyValArr : Array = new Array();
			applySchema( keyArr , valueArr );
		}

		override public function execute() : void
		{
			setRequestArgument('filterFields',filterFields);
			delegate = new SystemPingDelegate( this , config );
		}
	}
}
