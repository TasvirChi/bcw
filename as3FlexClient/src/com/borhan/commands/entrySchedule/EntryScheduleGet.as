package com.borhan.commands.entrySchedule
{
	import com.borhan.delegates.entrySchedule.EntryScheduleGetDelegate;
	import com.borhan.net.BorhanCall;

	public class EntryScheduleGet extends BorhanCall
	{
		public var filterFields : String;
		public function EntryScheduleGet( id : int )
		{
			service= 'entrySchedule';
			action= 'get';

			var keyArr : Array = new Array();
			var valueArr : Array = new Array();
			var keyValArr : Array = new Array();
			keyArr.push( 'id' );
			valueArr.push( id );
			applySchema( keyArr , valueArr );
		}

		override public function execute() : void
		{
			setRequestArgument('filterFields',filterFields);
			delegate = new EntryScheduleGetDelegate( this , config );
		}
	}
}
