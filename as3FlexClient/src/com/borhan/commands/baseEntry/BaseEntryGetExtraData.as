package com.borhan.commands.baseEntry
{
	import com.borhan.vo.BorhanEntryExtraDataParams;
	import com.borhan.delegates.baseEntry.BaseEntryGetExtraDataDelegate;
	import com.borhan.net.BorhanCall;

	public class BaseEntryGetExtraData extends BorhanCall
	{
		public var filterFields : String;
		public function BaseEntryGetExtraData( entryId : String,extraDataParams : BorhanEntryExtraDataParams )
		{
			service= 'baseEntry';
			action= 'getExtraData';

			var keyArr : Array = new Array();
			var valueArr : Array = new Array();
			var keyValArr : Array = new Array();
			keyArr.push( 'entryId' );
			valueArr.push( entryId );
 			keyValArr = borhanObject2Arrays(extraDataParams,'extraDataParams');
			keyArr = keyArr.concat( keyValArr[0] );
			valueArr = valueArr.concat( keyValArr[1] );
			applySchema( keyArr , valueArr );
		}

		override public function execute() : void
		{
			setRequestArgument('filterFields',filterFields);
			delegate = new BaseEntryGetExtraDataDelegate( this , config );
		}
	}
}
