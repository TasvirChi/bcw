package com.borhan.commands.stats
{
	import com.borhan.vo.BorhanStatsBmcEvent;
	import com.borhan.delegates.stats.StatsBmcCollectDelegate;
	import com.borhan.net.BorhanCall;

	public class StatsBmcCollect extends BorhanCall
	{
		public var filterFields : String;
		public function StatsBmcCollect( bmcEvent : BorhanStatsBmcEvent )
		{
			service= 'stats';
			action= 'bmcCollect';

			var keyArr : Array = new Array();
			var valueArr : Array = new Array();
			var keyValArr : Array = new Array();
 			keyValArr = borhanObject2Arrays(bmcEvent,'bmcEvent');
			keyArr = keyArr.concat( keyValArr[0] );
			valueArr = valueArr.concat( keyValArr[1] );
			applySchema( keyArr , valueArr );
		}

		override public function execute() : void
		{
			setRequestArgument('filterFields',filterFields);
			delegate = new StatsBmcCollectDelegate( this , config );
		}
	}
}
