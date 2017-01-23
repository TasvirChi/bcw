package com.borhan.commands.category
{
	import com.borhan.vo.BorhanCategory;
	import com.borhan.delegates.category.CategoryAddDelegate;
	import com.borhan.net.BorhanCall;

	public class CategoryAdd extends BorhanCall
	{
		public var filterFields : String;
		public function CategoryAdd( category : BorhanCategory )
		{
			service= 'category';
			action= 'add';

			var keyArr : Array = new Array();
			var valueArr : Array = new Array();
			var keyValArr : Array = new Array();
 			keyValArr = borhanObject2Arrays(category,'category');
			keyArr = keyArr.concat( keyValArr[0] );
			valueArr = valueArr.concat( keyValArr[1] );
			applySchema( keyArr , valueArr );
		}

		override public function execute() : void
		{
			setRequestArgument('filterFields',filterFields);
			delegate = new CategoryAddDelegate( this , config );
		}
	}
}
