package com.borhan.commands.media
{
	import com.borhan.delegates.media.MediaRejectDelegate;
	import com.borhan.net.BorhanCall;

	public class MediaReject extends BorhanCall
	{
		public var filterFields : String;
		public function MediaReject( entryId : String )
		{
			service= 'media';
			action= 'reject';

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
			delegate = new MediaRejectDelegate( this , config );
		}
	}
}
