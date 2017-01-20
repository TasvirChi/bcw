package com.borhan.commands.media
{
	import com.borhan.delegates.media.MediaDeleteDelegate;
	import com.borhan.net.BorhanCall;

	public class MediaDelete extends BorhanCall
	{
		public var filterFields : String;
		public function MediaDelete( entryId : String )
		{
			service= 'media';
			action= 'delete';

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
			delegate = new MediaDeleteDelegate( this , config );
		}
	}
}
