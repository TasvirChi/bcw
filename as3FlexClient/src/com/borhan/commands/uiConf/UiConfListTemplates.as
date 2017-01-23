package com.borhan.commands.uiConf
{
	import com.borhan.vo.BorhanUiConfFilter;
	import com.borhan.vo.BorhanFilterPager;
	import com.borhan.delegates.uiConf.UiConfListTemplatesDelegate;
	import com.borhan.net.BorhanCall;

	public class UiConfListTemplates extends BorhanCall
	{
		public var filterFields : String;
		public function UiConfListTemplates( filter : BorhanUiConfFilter=null,pager : BorhanFilterPager=null )
		{
			if(filter== null)filter= new BorhanUiConfFilter();
			if(pager== null)pager= new BorhanFilterPager();
			service= 'uiconf';
			action= 'listTemplates';

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
			delegate = new UiConfListTemplatesDelegate( this , config );
		}
	}
}
