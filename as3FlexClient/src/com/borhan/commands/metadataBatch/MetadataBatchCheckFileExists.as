package com.borhan.commands.metadataBatch
{
	import com.borhan.delegates.metadataBatch.MetadataBatchCheckFileExistsDelegate;
	import com.borhan.net.BorhanCall;

	public class MetadataBatchCheckFileExists extends BorhanCall
	{
		public var filterFields : String;
		public function MetadataBatchCheckFileExists( localPath : String,size : int )
		{
			service= 'metadata_metadatabatch';
			action= 'checkFileExists';

			var keyArr : Array = new Array();
			var valueArr : Array = new Array();
			var keyValArr : Array = new Array();
			keyArr.push( 'localPath' );
			valueArr.push( localPath );
			keyArr.push( 'size' );
			valueArr.push( size );
			applySchema( keyArr , valueArr );
		}

		override public function execute() : void
		{
			setRequestArgument('filterFields',filterFields);
			delegate = new MetadataBatchCheckFileExistsDelegate( this , config );
		}
	}
}
