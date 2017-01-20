package com.borhan.vo
{
	import com.borhan.vo.BorhanSearchItem;

	[Bindable]
	public dynamic class BorhanSearchCondition extends BorhanSearchItem
	{
		public var field : String;
		public var value : String;
		override protected function setupPropertyList():void
		{
			super.setupPropertyList();
			propertyList.push('field');
			propertyList.push('value');
		}
		override public function getParamKeys():Array
		{
			var arr : Array;
			arr = super.getParamKeys();
			arr.push('field');
			arr.push('value');
			return arr;
		}

		override public function getUpdateableParamKeys():Array
		{
			var arr : Array;
			arr = super.getUpdateableParamKeys();
			arr.push('field');
			arr.push('value');
			return arr;
		}

	}
}
