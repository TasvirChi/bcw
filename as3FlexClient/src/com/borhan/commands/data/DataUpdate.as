package com.borhan.commands.data
{
	import com.borhan.vo.BorhanDataEntry;
	import com.borhan.delegates.data.DataUpdateDelegate;
	import com.borhan.net.BorhanCall;

	public class DataUpdate extends BorhanCall
	{
		public var filterFields : String;
		public function DataUpdate( entryId : String,documentEntry : BorhanDataEntry )
		{
			service= 'data';
			action= 'update';

			var keyArr : Array = new Array();
			var valueArr : Array = new Array();
			var keyValArr : Array = new Array();
			keyArr.push( 'entryId' );
			valueArr.push( entryId );
 			keyValArr = borhanObject2Arrays(documentEntry,'documentEntry');
			keyArr = keyArr.concat( keyValArr[0] );
			valueArr = valueArr.concat( keyValArr[1] );
			applySchema( keyArr , valueArr );
		}

		override public function execute() : void
		{
			setRequestArgument('filterFields',filterFields);
			delegate = new DataUpdateDelegate( this , config );
		}
	}
}
