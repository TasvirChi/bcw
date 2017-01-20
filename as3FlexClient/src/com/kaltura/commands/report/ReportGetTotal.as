package com.borhan.commands.report
{
	import com.borhan.vo.BorhanReportInputFilter;
	import com.borhan.delegates.report.ReportGetTotalDelegate;
	import com.borhan.net.BorhanCall;

	public class ReportGetTotal extends BorhanCall
	{
		public var filterFields : String;
		public function ReportGetTotal( reportType : int,reportInputFilter : BorhanReportInputFilter,objectIds : String='' )
		{
			service= 'report';
			action= 'getTotal';

			var keyArr : Array = new Array();
			var valueArr : Array = new Array();
			var keyValArr : Array = new Array();
			keyArr.push( 'reportType' );
			valueArr.push( reportType );
 			keyValArr = borhanObject2Arrays(reportInputFilter,'reportInputFilter');
			keyArr = keyArr.concat( keyValArr[0] );
			valueArr = valueArr.concat( keyValArr[1] );
			keyArr.push( 'objectIds' );
			valueArr.push( objectIds );
			applySchema( keyArr , valueArr );
		}

		override public function execute() : void
		{
			setRequestArgument('filterFields',filterFields);
			delegate = new ReportGetTotalDelegate( this , config );
		}
	}
}
