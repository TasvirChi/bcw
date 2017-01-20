package com.borhan.commands.media
{
	import com.borhan.vo.BorhanFilterPager;
	import com.borhan.delegates.media.MediaListFlagsDelegate;
	import com.borhan.net.BorhanCall;

	public class MediaListFlags extends BorhanCall
	{
		public var filterFields : String;
		public function MediaListFlags( entryId : String,pager : BorhanFilterPager=null )
		{
			if(pager== null)pager= new BorhanFilterPager();
			service= 'media';
			action= 'listFlags';

			var keyArr : Array = new Array();
			var valueArr : Array = new Array();
			var keyValArr : Array = new Array();
			keyArr.push( 'entryId' );
			valueArr.push( entryId );
 			keyValArr = borhanObject2Arrays(pager,'pager');
			keyArr = keyArr.concat( keyValArr[0] );
			valueArr = valueArr.concat( keyValArr[1] );
			applySchema( keyArr , valueArr );
		}

		override public function execute() : void
		{
			setRequestArgument('filterFields',filterFields);
			delegate = new MediaListFlagsDelegate( this , config );
		}
	}
}
