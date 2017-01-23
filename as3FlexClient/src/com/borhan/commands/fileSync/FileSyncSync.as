package com.borhan.commands.fileSync
{
	import com.borhan.vo.File;
	import com.borhan.delegates.fileSync.FileSyncSyncDelegate;
	import com.borhan.net.BorhanCall;

	public class FileSyncSync extends BorhanCall
	{
		public var filterFields : String;
		public function FileSyncSync( fileSyncId : int,fileData : file )
		{
			service= 'filesync_filesync';
			action= 'sync';

			var keyArr : Array = new Array();
			var valueArr : Array = new Array();
			var keyValArr : Array = new Array();
			keyArr.push( 'fileSyncId' );
			valueArr.push( fileSyncId );
 			keyValArr = borhanObject2Arrays(fileData,'fileData');
			keyArr = keyArr.concat( keyValArr[0] );
			valueArr = valueArr.concat( keyValArr[1] );
			applySchema( keyArr , valueArr );
		}

		override public function execute() : void
		{
			setRequestArgument('filterFields',filterFields);
			delegate = new FileSyncSyncDelegate( this , config );
		}
	}
}
