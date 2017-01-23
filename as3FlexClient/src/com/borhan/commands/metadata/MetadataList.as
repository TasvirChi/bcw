package com.borhan.commands.metadata
{
	import com.borhan.vo.BorhanMetadataFilter;
	import com.borhan.vo.BorhanFilterPager;
	import com.borhan.delegates.metadata.MetadataListDelegate;
	import com.borhan.net.BorhanCall;

	public class MetadataList extends BorhanCall
	{
		public var filterFields : String;
		public function MetadataList( filter : BorhanMetadataFilter=null,pager : BorhanFilterPager=null )
		{
			if(filter== null)filter= new BorhanMetadataFilter();
			if(pager== null)pager= new BorhanFilterPager();
			service= 'metadata_metadata';
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
			delegate = new MetadataListDelegate( this , config );
		}
	}
}
