package com.borhan.commands.category
{
	import com.borhan.delegates.category.CategoryDeleteDelegate;
	import com.borhan.net.BorhanCall;

	public class CategoryDelete extends BorhanCall
	{
		public var filterFields : String;
		public function CategoryDelete( id : int )
		{
			service= 'category';
			action= 'delete';

			var keyArr : Array = new Array();
			var valueArr : Array = new Array();
			var keyValArr : Array = new Array();
			keyArr.push( 'id' );
			valueArr.push( id );
			applySchema( keyArr , valueArr );
		}

		override public function execute() : void
		{
			setRequestArgument('filterFields',filterFields);
			delegate = new CategoryDeleteDelegate( this , config );
		}
	}
}
