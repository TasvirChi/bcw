package com.borhan.commands.baseEntry
{
	import com.borhan.vo.BorhanBaseEntry;
	import com.borhan.delegates.baseEntry.BaseEntryUpdateDelegate;
	import com.borhan.net.BorhanCall;

	public class BaseEntryUpdate extends BorhanCall
	{
		public var filterFields : String;
		public function BaseEntryUpdate( entryId : String,baseEntry : BorhanBaseEntry )
		{
			service= 'baseentry';
			action= 'update';

			var keyArr : Array = new Array();
			var valueArr : Array = new Array();
			var keyValArr : Array = new Array();
			keyArr.push( 'entryId' );
			valueArr.push( entryId );
 			keyValArr = borhanObject2Arrays(baseEntry,'baseEntry');
			keyArr = keyArr.concat( keyValArr[0] );
			valueArr = valueArr.concat( keyValArr[1] );
			applySchema( keyArr , valueArr );
		}

		override public function execute() : void
		{
			setRequestArgument('filterFields',filterFields);
			delegate = new BaseEntryUpdateDelegate( this , config );
		}
	}
}
