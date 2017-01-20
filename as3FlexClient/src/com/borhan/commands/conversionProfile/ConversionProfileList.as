package com.borhan.commands.conversionProfile
{
	import com.borhan.vo.BorhanConversionProfileFilter;
	import com.borhan.vo.BorhanFilterPager;
	import com.borhan.delegates.conversionProfile.ConversionProfileListDelegate;
	import com.borhan.net.BorhanCall;

	public class ConversionProfileList extends BorhanCall
	{
		public var filterFields : String;
		public function ConversionProfileList( filter : BorhanConversionProfileFilter=null,pager : BorhanFilterPager=null )
		{
			if(filter== null)filter= new BorhanConversionProfileFilter();
			if(pager== null)pager= new BorhanFilterPager();
			service= 'conversionprofile';
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
			delegate = new ConversionProfileListDelegate( this , config );
		}
	}
}
