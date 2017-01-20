package com.borhan.commands.report
{
	import com.borhan.delegates.report.ReportGetGraphDelegate;
	import com.borhan.net.BorhanCall;

	public class ReportGetGraph extends BorhanCall
	{
		public var filterFields : String;
		public function ReportGetGraph(  )
		{
			service= 'report';
			action= 'getGraph';

			var keyArr : Array = new Array();
			var valueArr : Array = new Array();
			var keyValArr : Array = new Array();
			applySchema( keyArr , valueArr );
		}

		override public function execute() : void
		{
			setRequestArgument('filterFields',filterFields);
			delegate = new ReportGetGraphDelegate( this , config );
		}
	}
}
