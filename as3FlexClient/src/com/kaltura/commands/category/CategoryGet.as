package com.borhan.commands.category
{
	import com.borhan.delegates.category.CategoryGetDelegate;
	import com.borhan.net.BorhanCall;

	public class CategoryGet extends BorhanCall
	{
		public var filterFields : String;
		public function CategoryGet( id : int )
		{
			service= 'category';
			action= 'get';

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
			delegate = new CategoryGetDelegate( this , config );
		}
	}
}
