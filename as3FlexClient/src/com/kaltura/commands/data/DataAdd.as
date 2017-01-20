package com.borhan.commands.data
{
	import com.borhan.vo.BorhanDataEntry;
	import com.borhan.delegates.data.DataAddDelegate;
	import com.borhan.net.BorhanCall;

	public class DataAdd extends BorhanCall
	{
		public var filterFields : String;
		public function DataAdd( dataEntry : BorhanDataEntry )
		{
			service= 'data';
			action= 'add';

			var keyArr : Array = new Array();
			var valueArr : Array = new Array();
			var keyValArr : Array = new Array();
 			keyValArr = borhanObject2Arrays(dataEntry,'dataEntry');
			keyArr = keyArr.concat( keyValArr[0] );
			valueArr = valueArr.concat( keyValArr[1] );
			applySchema( keyArr , valueArr );
		}

		override public function execute() : void
		{
			setRequestArgument('filterFields',filterFields);
			delegate = new DataAddDelegate( this , config );
		}
	}
}
