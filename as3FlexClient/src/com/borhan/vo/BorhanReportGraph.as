package com.borhan.vo
{
	import com.borhan.vo.BaseFlexVo;
	[Bindable]
	public dynamic class BorhanReportGraph extends BaseFlexVo
	{
		public var id : String;
		public var data : String;
		override protected function setupPropertyList():void
		{
			super.setupPropertyList();
			propertyList.push('id');
			propertyList.push('data');
		}
		public function getParamKeys():Array
		{
			var arr : Array;
			arr = new Array();
			arr.push('id');
			arr.push('data');
			return arr;
		}

		public function getUpdateableParamKeys():Array
		{
			var arr : Array;
			arr = new Array();
			arr.push('id');
			arr.push('data');
			return arr;
		}

	}
}
