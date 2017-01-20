package com.borhan.commands.media
{
	import com.borhan.delegates.media.MediaGetDelegate;
	import com.borhan.net.BorhanCall;

	public class MediaGet extends BorhanCall
	{
		public var filterFields : String;
		public function MediaGet( entryId : String,version : int=-1 )
		{
			service= 'media';
			action= 'get';

			var keyArr : Array = new Array();
			var valueArr : Array = new Array();
			var keyValArr : Array = new Array();
			keyArr.push( 'entryId' );
			valueArr.push( entryId );
			keyArr.push( 'version' );
			valueArr.push( version );
			applySchema( keyArr , valueArr );
		}

		override public function execute() : void
		{
			setRequestArgument('filterFields',filterFields);
			delegate = new MediaGetDelegate( this , config );
		}
	}
}
