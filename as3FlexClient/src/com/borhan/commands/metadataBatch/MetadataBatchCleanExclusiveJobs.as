package com.borhan.commands.metadataBatch
{
	import com.borhan.delegates.metadataBatch.MetadataBatchCleanExclusiveJobsDelegate;
	import com.borhan.net.BorhanCall;

	public class MetadataBatchCleanExclusiveJobs extends BorhanCall
	{
		public var filterFields : String;
		public function MetadataBatchCleanExclusiveJobs(  )
		{
			service= 'metadata_metadatabatch';
			action= 'cleanExclusiveJobs';

			var keyArr : Array = new Array();
			var valueArr : Array = new Array();
			var keyValArr : Array = new Array();
			applySchema( keyArr , valueArr );
		}

		override public function execute() : void
		{
			setRequestArgument('filterFields',filterFields);
			delegate = new MetadataBatchCleanExclusiveJobsDelegate( this , config );
		}
	}
}
