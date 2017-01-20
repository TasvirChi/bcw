package com.borhan.commands.category
{
	import com.borhan.vo.BorhanCategory;
	import com.borhan.delegates.category.CategoryUpdateDelegate;
	import com.borhan.net.BorhanCall;

	public class CategoryUpdate extends BorhanCall
	{
		public var filterFields : String;
		public function CategoryUpdate( id : int,category : BorhanCategory )
		{
			service= 'category';
			action= 'update';

			var keyArr : Array = new Array();
			var valueArr : Array = new Array();
			var keyValArr : Array = new Array();
			keyArr.push( 'id' );
			valueArr.push( id );
 			keyValArr = borhanObject2Arrays(category,'category');
			keyArr = keyArr.concat( keyValArr[0] );
			valueArr = valueArr.concat( keyValArr[1] );
			applySchema( keyArr , valueArr );
		}

		override public function execute() : void
		{
			setRequestArgument('filterFields',filterFields);
			delegate = new CategoryUpdateDelegate( this , config );
		}
	}
}
