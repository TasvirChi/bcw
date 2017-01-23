package com.borhan.commands.baseEntry
{
	import com.borhan.delegates.baseEntry.BaseEntryGetByIdsDelegate;
	import com.borhan.net.BorhanCall;

	public class BaseEntryGetByIds extends BorhanCall
	{
		public var filterFields : String;
		public function BaseEntryGetByIds( entryIds : String )
		{
			service= 'baseentry';
			action= 'getByIds';

			var keyArr : Array = new Array();
			var valueArr : Array = new Array();
			var keyValArr : Array = new Array();
			keyArr.push( 'entryIds' );
			valueArr.push( entryIds );
			applySchema( keyArr , valueArr );
		}

		override public function execute() : void
		{
			setRequestArgument('filterFields',filterFields);
			delegate = new BaseEntryGetByIdsDelegate( this , config );
		}
	}
}
