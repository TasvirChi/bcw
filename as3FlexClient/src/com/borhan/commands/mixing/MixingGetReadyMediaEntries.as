package com.borhan.commands.mixing
{
	import com.borhan.delegates.mixing.MixingGetReadyMediaEntriesDelegate;
	import com.borhan.net.BorhanCall;

	public class MixingGetReadyMediaEntries extends BorhanCall
	{
		public var filterFields : String;
		public function MixingGetReadyMediaEntries( mixId : String,version : int=-1 )
		{
			service= 'mixing';
			action= 'getReadyMediaEntries';

			var keyArr : Array = new Array();
			var valueArr : Array = new Array();
			var keyValArr : Array = new Array();
			keyArr.push( 'mixId' );
			valueArr.push( mixId );
			keyArr.push( 'version' );
			valueArr.push( version );
			applySchema( keyArr , valueArr );
		}

		override public function execute() : void
		{
			setRequestArgument('filterFields',filterFields);
			delegate = new MixingGetReadyMediaEntriesDelegate( this , config );
		}
	}
}
