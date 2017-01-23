package com.borhan.commands.report
{
	import com.borhan.vo.BorhanReportInputFilter;
	import com.borhan.vo.BorhanFilterPager;
	import com.borhan.delegates.report.ReportGetTableDelegate;
	import com.borhan.net.BorhanCall;

	public class ReportGetTable extends BorhanCall
	{
		public var filterFields : String;
		public function ReportGetTable( reportType : int,reportInputFilter : BorhanReportInputFilter,pager : BorhanFilterPager,order : String='',objectIds : String='' )
		{
			service= 'report';
			action= 'getTable';

			var keyArr : Array = new Array();
			var valueArr : Array = new Array();
			var keyValArr : Array = new Array();
			keyArr.push( 'reportType' );
			valueArr.push( reportType );
 			keyValArr = borhanObject2Arrays(reportInputFilter,'reportInputFilter');
			keyArr = keyArr.concat( keyValArr[0] );
			valueArr = valueArr.concat( keyValArr[1] );
 			keyValArr = borhanObject2Arrays(pager,'pager');
			keyArr = keyArr.concat( keyValArr[0] );
			valueArr = valueArr.concat( keyValArr[1] );
			keyArr.push( 'order' );
			valueArr.push( order );
			keyArr.push( 'objectIds' );
			valueArr.push( objectIds );
			applySchema( keyArr , valueArr );
		}

		override public function execute() : void
		{
			setRequestArgument('filterFields',filterFields);
			delegate = new ReportGetTableDelegate( this , config );
		}
	}
}
