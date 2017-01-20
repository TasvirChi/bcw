package com.borhan.commands.media
{
	import com.borhan.delegates.media.MediaApproveDelegate;
	import com.borhan.net.BorhanCall;

	public class MediaApprove extends BorhanCall
	{
		public var filterFields : String;
		public function MediaApprove( entryId : String )
		{
			service= 'media';
			action= 'approve';

			var keyArr : Array = new Array();
			var valueArr : Array = new Array();
			var keyValArr : Array = new Array();
			keyArr.push( 'entryId' );
			valueArr.push( entryId );
			applySchema( keyArr , valueArr );
		}

		override public function execute() : void
		{
			setRequestArgument('filterFields',filterFields);
			delegate = new MediaApproveDelegate( this , config );
		}
	}
}
