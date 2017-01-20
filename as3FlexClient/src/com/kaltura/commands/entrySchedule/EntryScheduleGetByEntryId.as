package com.borhan.commands.entrySchedule
{
	import com.borhan.delegates.entrySchedule.EntryScheduleGetByEntryIdDelegate;
	import com.borhan.net.BorhanCall;

	public class EntryScheduleGetByEntryId extends BorhanCall
	{
		public var filterFields : String;
		public function EntryScheduleGetByEntryId( entryId : String )
		{
			service= 'entrySchedule';
			action= 'getByEntryId';

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
			delegate = new EntryScheduleGetByEntryIdDelegate( this , config );
		}
	}
}
