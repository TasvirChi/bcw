package com.borhan.commands.media
{
	import com.borhan.vo.BorhanMediaEntryFilter;
	import com.borhan.delegates.media.MediaCountDelegate;
	import com.borhan.net.BorhanCall;

	public class MediaCount extends BorhanCall
	{
		public var filterFields : String;
		public function MediaCount( filter : BorhanMediaEntryFilter=null )
		{
			if(filter== null)filter= new BorhanMediaEntryFilter();
			service= 'media';
			action= 'count';

			var keyArr : Array = new Array();
			var valueArr : Array = new Array();
			var keyValArr : Array = new Array();
 			keyValArr = borhanObject2Arrays(filter,'filter');
			keyArr = keyArr.concat( keyValArr[0] );
			valueArr = valueArr.concat( keyValArr[1] );
			applySchema( keyArr , valueArr );
		}

		override public function execute() : void
		{
			setRequestArgument('filterFields',filterFields);
			delegate = new MediaCountDelegate( this , config );
		}
	}
}
