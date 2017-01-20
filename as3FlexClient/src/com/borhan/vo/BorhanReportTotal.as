package com.borhan.vo
{
	import com.borhan.vo.BaseFlexVo;
	[Bindable]
	public dynamic class BorhanReportTotal extends BaseFlexVo
	{
		public var header : String;
		public var data : String;
		override protected function setupPropertyList():void
		{
			super.setupPropertyList();
			propertyList.push('header');
			propertyList.push('data');
		}
		public function getParamKeys():Array
		{
			var arr : Array;
			arr = new Array();
			arr.push('header');
			arr.push('data');
			return arr;
		}

		public function getUpdateableParamKeys():Array
		{
			var arr : Array;
			arr = new Array();
			arr.push('header');
			arr.push('data');
			return arr;
		}

	}
}
