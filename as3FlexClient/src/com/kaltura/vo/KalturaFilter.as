package com.borhan.vo
{
	import com.borhan.vo.BorhanSearchItem;

	import com.borhan.vo.BaseFlexVo;
	[Bindable]
	public dynamic class BorhanFilter extends BaseFlexVo
	{
		public var orderBy : String;
		public var advancedSearch : BorhanSearchItem;
		override protected function setupPropertyList():void
		{
			super.setupPropertyList();
			propertyList.push('orderBy');
			propertyList.push('advancedSearch');
		}
		public function getParamKeys():Array
		{
			var arr : Array;
			arr = new Array();
			arr.push('orderBy');
			arr.push('advancedSearch');
			return arr;
		}

		public function getUpdateableParamKeys():Array
		{
			var arr : Array;
			arr = new Array();
			arr.push('orderBy');
			arr.push('advancedSearch');
			return arr;
		}

	}
}
