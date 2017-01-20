package com.borhan.commands.flavorParamsOutput
{
	import com.borhan.vo.BorhanFlavorParamsOutputFilter;
	import com.borhan.vo.BorhanFilterPager;
	import com.borhan.delegates.flavorParamsOutput.FlavorParamsOutputListDelegate;
	import com.borhan.net.BorhanCall;

	public class FlavorParamsOutputList extends BorhanCall
	{
		public var filterFields : String;
		public function FlavorParamsOutputList( filter : BorhanFlavorParamsOutputFilter=null,pager : BorhanFilterPager=null )
		{
			if(filter== null)filter= new BorhanFlavorParamsOutputFilter();
			if(pager== null)pager= new BorhanFilterPager();
			service= 'adminconsole_flavorparamsoutput';
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
			delegate = new FlavorParamsOutputListDelegate( this , config );
		}
	}
}
