package com.borhan.commands.flavorParams
{
	import com.borhan.vo.BorhanFlavorParamsFilter;
	import com.borhan.vo.BorhanFilterPager;
	import com.borhan.delegates.flavorParams.FlavorParamsListDelegate;
	import com.borhan.net.BorhanCall;

	public class FlavorParamsList extends BorhanCall
	{
		public var filterFields : String;
		public function FlavorParamsList( filter : BorhanFlavorParamsFilter=null,pager : BorhanFilterPager=null )
		{
			if(filter== null)filter= new BorhanFlavorParamsFilter();
			if(pager== null)pager= new BorhanFilterPager();
			service= 'flavorparams';
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
			delegate = new FlavorParamsListDelegate( this , config );
		}
	}
}
