package com.borhan.commands.media
{
	import com.borhan.delegates.media.MediaRequestConversionDelegate;
	import com.borhan.net.BorhanCall;

	public class MediaRequestConversion extends BorhanCall
	{
		public var filterFields : String;
		public function MediaRequestConversion( entryId : String,fileFormat : String )
		{
			service= 'media';
			action= 'requestConversion';

			var keyArr : Array = new Array();
			var valueArr : Array = new Array();
			var keyValArr : Array = new Array();
			keyArr.push( 'entryId' );
			valueArr.push( entryId );
			keyArr.push( 'fileFormat' );
			valueArr.push( fileFormat );
			applySchema( keyArr , valueArr );
		}

		override public function execute() : void
		{
			setRequestArgument('filterFields',filterFields);
			delegate = new MediaRequestConversionDelegate( this , config );
		}
	}
}
