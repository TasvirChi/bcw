package com.borhan.commands.metadataBatch
{
	import com.borhan.delegates.metadataBatch.MetadataBatchUpdateBulkUploadResultsDelegate;
	import com.borhan.net.BorhanCall;

	public class MetadataBatchUpdateBulkUploadResults extends BorhanCall
	{
		public var filterFields : String;
		public function MetadataBatchUpdateBulkUploadResults( bulkUploadJobId : int )
		{
			service= 'metadata_metadatabatch';
			action= 'updateBulkUploadResults';

			var keyArr : Array = new Array();
			var valueArr : Array = new Array();
			var keyValArr : Array = new Array();
			keyArr.push( 'bulkUploadJobId' );
			valueArr.push( bulkUploadJobId );
			applySchema( keyArr , valueArr );
		}

		override public function execute() : void
		{
			setRequestArgument('filterFields',filterFields);
			delegate = new MetadataBatchUpdateBulkUploadResultsDelegate( this , config );
		}
	}
}
