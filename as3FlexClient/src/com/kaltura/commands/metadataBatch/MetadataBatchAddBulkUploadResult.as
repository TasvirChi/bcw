package com.borhan.commands.metadataBatch
{
	import com.borhan.vo.BorhanBulkUploadResult;
	import com.borhan.delegates.metadataBatch.MetadataBatchAddBulkUploadResultDelegate;
	import com.borhan.net.BorhanCall;

	public class MetadataBatchAddBulkUploadResult extends BorhanCall
	{
		public var filterFields : String;
		public function MetadataBatchAddBulkUploadResult( bulkUploadResult : BorhanBulkUploadResult,pluginDataArray : Array=null )
		{
			if(pluginDataArray== null)pluginDataArray= new Array();
			service= 'metadata_metadatabatch';
			action= 'addBulkUploadResult';

			var keyArr : Array = new Array();
			var valueArr : Array = new Array();
			var keyValArr : Array = new Array();
 			keyValArr = borhanObject2Arrays(bulkUploadResult,'bulkUploadResult');
			keyArr = keyArr.concat( keyValArr[0] );
			valueArr = valueArr.concat( keyValArr[1] );
 			keyValArr = extractArray(pluginDataArray,'pluginDataArray');
			keyArr = keyArr.concat( keyValArr[0] );
			valueArr = valueArr.concat( keyValArr[1] );
			applySchema( keyArr , valueArr );
		}

		override public function execute() : void
		{
			setRequestArgument('filterFields',filterFields);
			delegate = new MetadataBatchAddBulkUploadResultDelegate( this , config );
		}
	}
}
