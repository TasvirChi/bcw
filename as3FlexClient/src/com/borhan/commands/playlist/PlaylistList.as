package com.borhan.commands.playlist
{
	import com.borhan.vo.BorhanPlaylistFilter;
	import com.borhan.vo.BorhanFilterPager;
	import com.borhan.delegates.playlist.PlaylistListDelegate;
	import com.borhan.net.BorhanCall;

	public class PlaylistList extends BorhanCall
	{
		public var filterFields : String;
		public function PlaylistList( filter : BorhanPlaylistFilter=null,pager : BorhanFilterPager=null )
		{
			if(filter== null)filter= new BorhanPlaylistFilter();
			if(pager== null)pager= new BorhanFilterPager();
			service= 'playlist';
			action= 'list';

			var keyArr : Array = new Array();
			var valueArr : Array = new Array();
			var keyValArr : Array = new Array();
 			keyValArr = borhanObject2Arrays(filter,'filter');
			keyArr = keyArr.concat( keyValArr[0] );
			valueArr = valueArr.concat( keyValArr[1] );
 			keyValArr = borhanObject2Arrays(pager,'pager');
			keyArr = keyArr.concat( keyValArr[0] );
			valueArr = valueArr.concat( keyValArr[1] );
			applySchema( keyArr , valueArr );
		}

		override public function execute() : void
		{
			setRequestArgument('filterFields',filterFields);
			delegate = new PlaylistListDelegate( this , config );
		}
	}
}
