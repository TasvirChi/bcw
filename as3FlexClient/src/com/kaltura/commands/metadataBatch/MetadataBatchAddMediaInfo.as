package com.borhan.commands.metadataBatch
{
	import com.borhan.vo.BorhanMediaInfo;
	import com.borhan.delegates.metadataBatch.MetadataBatchAddMediaInfoDelegate;
	import com.borhan.net.BorhanCall;

	public class MetadataBatchAddMediaInfo extends BorhanCall
	{
		public var filterFields : String;
		public function MetadataBatchAddMediaInfo( mediaInfo : BorhanMediaInfo )
		{
			service= 'metadata_metadatabatch';
			action= 'addMediaInfo';

			var keyArr : Array = new Array();
			var valueArr : Array = new Array();
			var keyValArr : Array = new Array();
 			keyValArr = borhanObject2Arrays(mediaInfo,'mediaInfo');
			keyArr = keyArr.concat( keyValArr[0] );
			valueArr = valueArr.concat( keyValArr[1] );
			applySchema( keyArr , valueArr );
		}

		override public function execute() : void
		{
			setRequestArgument('filterFields',filterFields);
			delegate = new MetadataBatchAddMediaInfoDelegate( this , config );
		}
	}
}
