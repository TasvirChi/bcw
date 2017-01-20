package com.borhan.commands.metadataProfile
{
	import com.borhan.vo.BorhanMetadataProfileFilter;
	import com.borhan.vo.BorhanFilterPager;
	import com.borhan.delegates.metadataProfile.MetadataProfileListDelegate;
	import com.borhan.net.BorhanCall;

	public class MetadataProfileList extends BorhanCall
	{
		public var filterFields : String;
		public function MetadataProfileList( filter : BorhanMetadataProfileFilter=null,pager : BorhanFilterPager=null )
		{
			if(filter== null)filter= new BorhanMetadataProfileFilter();
			if(pager== null)pager= new BorhanFilterPager();
			service= 'metadata_metadataprofile';
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
			delegate = new MetadataProfileListDelegate( this , config );
		}
	}
}
