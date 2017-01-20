package com.borhan.commands.category
{
	import com.borhan.vo.BorhanCategoryFilter;
	import com.borhan.delegates.category.CategoryListDelegate;
	import com.borhan.net.BorhanCall;

	public class CategoryList extends BorhanCall
	{
		public var filterFields : String;
		public function CategoryList( filter : BorhanCategoryFilter=null )
		{
			if(filter== null)filter= new BorhanCategoryFilter();
			service= 'category';
			action= 'list';

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
			delegate = new CategoryListDelegate( this , config );
		}
	}
}
