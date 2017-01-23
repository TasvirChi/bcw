package com.borhan.commands.baseEntry
{
	import com.borhan.vo.BorhanBaseEntryFilter;
	import com.borhan.delegates.baseEntry.BaseEntryCountDelegate;
	import com.borhan.net.BorhanCall;

	public class BaseEntryCount extends BorhanCall
	{
		public var filterFields : String;
		public function BaseEntryCount( filter : BorhanBaseEntryFilter=null )
		{
			if(filter== null)filter= new BorhanBaseEntryFilter();
			service= 'baseentry';
			action= 'count';

			var keyArr : Array = new Array();
			var valueArr : Array = new Array();
			var keyValArr : Array = new Array();
 			keyValArr = borhanObject2Arrays(filter,'filter');
			keyArr = keyArr.concat( keyValArr[0] );
			valueArr = valueArr.concat( keyValArr[1] );
			applySchema( keyArr , valueArr );
		}

		override public function execute() : void
		{
			setRequestArgument('filterFields',filterFields);
			delegate = new BaseEntryCountDelegate( this , config );
		}
	}
}
