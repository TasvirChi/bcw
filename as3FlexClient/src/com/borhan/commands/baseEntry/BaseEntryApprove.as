package com.borhan.commands.baseEntry
{
	import com.borhan.delegates.baseEntry.BaseEntryApproveDelegate;
	import com.borhan.net.BorhanCall;

	public class BaseEntryApprove extends BorhanCall
	{
		public var filterFields : String;
		public function BaseEntryApprove( entryId : String )
		{
			service= 'baseentry';
			action= 'approve';

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
			delegate = new BaseEntryApproveDelegate( this , config );
		}
	}
}
