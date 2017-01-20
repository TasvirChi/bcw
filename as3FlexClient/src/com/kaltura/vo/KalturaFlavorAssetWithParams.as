package com.borhan.vo
{
	import com.borhan.vo.BorhanFlavorParams;

	import com.borhan.vo.BorhanFlavorAsset;

	import com.borhan.vo.BaseFlexVo;
	[Bindable]
	public dynamic class BorhanFlavorAssetWithParams extends BaseFlexVo
	{
		public var flavorAsset : BorhanFlavorAsset;
		public var flavorParams : BorhanFlavorParams;
		public var entryId : String;
		override protected function setupPropertyList():void
		{
			super.setupPropertyList();
			propertyList.push('flavorAsset');
			propertyList.push('flavorParams');
			propertyList.push('entryId');
		}
		public function getParamKeys():Array
		{
			var arr : Array;
			arr = new Array();
			arr.push('flavorAsset');
			arr.push('flavorParams');
			arr.push('entryId');
			return arr;
		}

		public function getUpdateableParamKeys():Array
		{
			var arr : Array;
			arr = new Array();
			arr.push('flavorAsset');
			arr.push('flavorParams');
			arr.push('entryId');
			return arr;
		}

	}
}
