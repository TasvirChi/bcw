package com.borhan.commands.baseEntry
{
	import com.borhan.delegates.baseEntry.BaseEntryDeleteDelegate;
	import com.borhan.net.BorhanCall;

	public class BaseEntryDelete extends BorhanCall
	{
		public var filterFields : String;
		public function BaseEntryDelete( entryId : String )
		{
			service= 'baseentry';
			action= 'delete';

			var keyArr : Array = new Array();
			var valueArr : Array = new Array();
			var keyValArr : Array = new Array();
			keyArr.push( 'entryId' );
			valueArr.push( entryId );
			applySchema( keyArr , valueArr );
		}

		override public function execute() : void
		{
			setRequestArgument('filterFields',filterFields);
			delegate = new BaseEntryDeleteDelegate( this , config );
		}
	}
}
