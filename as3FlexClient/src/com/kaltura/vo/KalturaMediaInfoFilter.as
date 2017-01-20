package com.borhan.vo
{
	import com.borhan.vo.BorhanFilter;

	[Bindable]
	public dynamic class BorhanMediaInfoFilter extends BorhanFilter
	{
		public var flavorAssetIdEqual : String;
		override protected function setupPropertyList():void
		{
			super.setupPropertyList();
			propertyList.push('flavorAssetIdEqual');
		}
		override public function getParamKeys():Array
		{
			var arr : Array;
			arr = super.getParamKeys();
			arr.push('flavorAssetIdEqual');
			return arr;
		}

		override public function getUpdateableParamKeys():Array
		{
			var arr : Array;
			arr = super.getUpdateableParamKeys();
			arr.push('flavorAssetIdEqual');
			return arr;
		}

	}
}
