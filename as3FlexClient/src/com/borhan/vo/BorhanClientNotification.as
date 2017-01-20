package com.borhan.vo
{
	import com.borhan.vo.BaseFlexVo;
	[Bindable]
	public dynamic class BorhanClientNotification extends BaseFlexVo
	{
		public var url : String;
		public var data : String;
		override protected function setupPropertyList():void
		{
			super.setupPropertyList();
			propertyList.push('url');
			propertyList.push('data');
		}
		public function getParamKeys():Array
		{
			var arr : Array;
			arr = new Array();
			arr.push('url');
			arr.push('data');
			return arr;
		}

		public function getUpdateableParamKeys():Array
		{
			var arr : Array;
			arr = new Array();
			arr.push('url');
			arr.push('data');
			return arr;
		}

	}
}
