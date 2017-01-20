package com.borhan.commands.baseEntry
{
	import com.borhan.vo.BorhanModerationFlag;
	import com.borhan.delegates.baseEntry.BaseEntryFlagDelegate;
	import com.borhan.net.BorhanCall;

	public class BaseEntryFlag extends BorhanCall
	{
		public var filterFields : String;
		public function BaseEntryFlag( moderationFlag : BorhanModerationFlag )
		{
			service= 'baseentry';
			action= 'flag';

			var keyArr : Array = new Array();
			var valueArr : Array = new Array();
			var keyValArr : Array = new Array();
 			keyValArr = borhanObject2Arrays(moderationFlag,'moderationFlag');
			keyArr = keyArr.concat( keyValArr[0] );
			valueArr = valueArr.concat( keyValArr[1] );
			applySchema( keyArr , valueArr );
		}

		override public function execute() : void
		{
			setRequestArgument('filterFields',filterFields);
			delegate = new BaseEntryFlagDelegate( this , config );
		}
	}
}
