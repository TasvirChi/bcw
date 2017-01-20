package com.borhan.commands.entryAdmin
{
	import com.borhan.delegates.entryAdmin.EntryAdminGetDelegate;
	import com.borhan.net.BorhanCall;

	public class EntryAdminGet extends BorhanCall
	{
		public var filterFields : String;
		public function EntryAdminGet( entryId : String,version : int=-1 )
		{
			service= 'adminconsole_entryadmin';
			action= 'get';

			var keyArr : Array = new Array();
			var valueArr : Array = new Array();
			var keyValArr : Array = new Array();
			keyArr.push( 'entryId' );
			valueArr.push( entryId );
			keyArr.push( 'version' );
			valueArr.push( version );
			applySchema( keyArr , valueArr );
		}

		override public function execute() : void
		{
			setRequestArgument('filterFields',filterFields);
			delegate = new EntryAdminGetDelegate( this , config );
		}
	}
}
