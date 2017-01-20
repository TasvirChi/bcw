package com.borhan.commands.baseEntry
{
	import com.borhan.vo.BorhanEntryContextDataParams;
	import com.borhan.delegates.baseEntry.BaseEntryGetContextDataDelegate;
	import com.borhan.net.BorhanCall;

	public class BaseEntryGetContextData extends BorhanCall
	{
		public var filterFields : String;
		public function BaseEntryGetContextData( entryId : String,contextDataParams : BorhanEntryContextDataParams )
		{
			service= 'baseentry';
			action= 'getContextData';

			var keyArr : Array = new Array();
			var valueArr : Array = new Array();
			var keyValArr : Array = new Array();
			keyArr.push( 'entryId' );
			valueArr.push( entryId );
 			keyValArr = borhanObject2Arrays(contextDataParams,'contextDataParams');
			keyArr = keyArr.concat( keyValArr[0] );
			valueArr = valueArr.concat( keyValArr[1] );
			applySchema( keyArr , valueArr );
		}

		override public function execute() : void
		{
			setRequestArgument('filterFields',filterFields);
			delegate = new BaseEntryGetContextDataDelegate( this , config );
		}
	}
}
