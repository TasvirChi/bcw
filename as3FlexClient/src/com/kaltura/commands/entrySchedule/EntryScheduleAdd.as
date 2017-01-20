package com.borhan.commands.entrySchedule
{
	import com.borhan.vo.BorhanEntrySchedule;
	import com.borhan.delegates.entrySchedule.EntryScheduleAddDelegate;
	import com.borhan.net.BorhanCall;

	public class EntryScheduleAdd extends BorhanCall
	{
		public var filterFields : String;
		public function EntryScheduleAdd( entrySchedule : BorhanEntrySchedule )
		{
			service= 'entrySchedule';
			action= 'add';

			var keyArr : Array = new Array();
			var valueArr : Array = new Array();
			var keyValArr : Array = new Array();
 			keyValArr = borhanObject2Arrays(entrySchedule,'entrySchedule');
			keyArr = keyArr.concat( keyValArr[0] );
			valueArr = valueArr.concat( keyValArr[1] );
			applySchema( keyArr , valueArr );
		}

		override public function execute() : void
		{
			setRequestArgument('filterFields',filterFields);
			delegate = new EntryScheduleAddDelegate( this , config );
		}
	}
}
