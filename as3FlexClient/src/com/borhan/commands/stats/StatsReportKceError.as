package com.borhan.commands.stats
{
	import com.borhan.vo.BorhanCEError;
	import com.borhan.delegates.stats.StatsReportKceErrorDelegate;
	import com.borhan.net.BorhanCall;

	public class StatsReportKceError extends BorhanCall
	{
		public var filterFields : String;
		public function StatsReportKceError( borhanCEError : BorhanCEError )
		{
			service= 'stats';
			action= 'reportKceError';

			var keyArr : Array = new Array();
			var valueArr : Array = new Array();
			var keyValArr : Array = new Array();
 			keyValArr = borhanObject2Arrays(borhanCEError,'borhanCEError');
			keyArr = keyArr.concat( keyValArr[0] );
			valueArr = valueArr.concat( keyValArr[1] );
			applySchema( keyArr , valueArr );
		}

		override public function execute() : void
		{
			setRequestArgument('filterFields',filterFields);
			delegate = new StatsReportKceErrorDelegate( this , config );
		}
	}
}
