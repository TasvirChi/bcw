package com.borhan.vo
{
	import com.borhan.vo.BaseFlexVo;
	[Bindable]
	public dynamic class BorhanBulkUploadPluginData extends BaseFlexVo
	{
		public var field : String;
		public var value : String;
		override protected function setupPropertyList():void
		{
			super.setupPropertyList();
			propertyList.push('field');
			propertyList.push('value');
		}
		public function getParamKeys():Array
		{
			var arr : Array;
			arr = new Array();
			arr.push('field');
			arr.push('value');
			return arr;
		}

		public function getUpdateableParamKeys():Array
		{
			var arr : Array;
			arr = new Array();
			arr.push('field');
			arr.push('value');
			return arr;
		}

	}
}
