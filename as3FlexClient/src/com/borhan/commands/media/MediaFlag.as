package com.borhan.commands.media
{
	import com.borhan.vo.BorhanModerationFlag;
	import com.borhan.delegates.media.MediaFlagDelegate;
	import com.borhan.net.BorhanCall;

	public class MediaFlag extends BorhanCall
	{
		public var filterFields : String;
		public function MediaFlag( moderationFlag : BorhanModerationFlag )
		{
			service= 'media';
			action= 'flag';

			var keyArr : Array = new Array();
			var valueArr : Array = new Array();
			var keyValArr : Array = new Array();
 			keyValArr = borhanObject2Arrays(moderationFlag,'moderationFlag');
			keyArr = keyArr.concat( keyValArr[0] );
			valueArr = valueArr.concat( keyValArr[1] );
			applySchema( keyArr , valueArr );
		}

		override public function execute() : void
		{
			setRequestArgument('filterFields',filterFields);
			delegate = new MediaFlagDelegate( this , config );
		}
	}
}
