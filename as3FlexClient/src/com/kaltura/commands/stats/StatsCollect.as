package com.borhan.commands.stats
{
	import com.borhan.vo.BorhanStatsEvent;
	import com.borhan.delegates.stats.StatsCollectDelegate;
	import com.borhan.net.BorhanCall;

	public class StatsCollect extends BorhanCall
	{
		public var filterFields : String;
		public function StatsCollect( event : BorhanStatsEvent )
		{
			service= 'stats';
			action= 'collect';

			var keyArr : Array = new Array();
			var valueArr : Array = new Array();
			var keyValArr : Array = new Array();
 			keyValArr = borhanObject2Arrays(event,'event');
			keyArr = keyArr.concat( keyValArr[0] );
			valueArr = valueArr.concat( keyValArr[1] );
			applySchema( keyArr , valueArr );
		}

		override public function execute() : void
		{
			setRequestArgument('filterFields',filterFields);
			delegate = new StatsCollectDelegate( this , config );
		}
	}
}
