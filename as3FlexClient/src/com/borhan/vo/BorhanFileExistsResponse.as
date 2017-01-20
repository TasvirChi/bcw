package com.borhan.vo
{
	import com.borhan.vo.BaseFlexVo;
	[Bindable]
	public dynamic class BorhanFileExistsResponse extends BaseFlexVo
	{
		public var exists : Boolean;
		public var sizeOk : Boolean;
		override protected function setupPropertyList():void
		{
			super.setupPropertyList();
			propertyList.push('exists');
			propertyList.push('sizeOk');
		}
		public function getParamKeys():Array
		{
			var arr : Array;
			arr = new Array();
			arr.push('exists');
			arr.push('sizeOk');
			return arr;
		}

		public function getUpdateableParamKeys():Array
		{
			var arr : Array;
			arr = new Array();
			arr.push('exists');
			arr.push('sizeOk');
			return arr;
		}

	}
}
