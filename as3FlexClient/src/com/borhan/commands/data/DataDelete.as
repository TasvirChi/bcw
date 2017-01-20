package com.borhan.commands.data
{
	import com.borhan.delegates.data.DataDeleteDelegate;
	import com.borhan.net.BorhanCall;

	public class DataDelete extends BorhanCall
	{
		public var filterFields : String;
		public function DataDelete( entryId : String )
		{
			service= 'data';
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
			delegate = new DataDeleteDelegate( this , config );
		}
	}
}
