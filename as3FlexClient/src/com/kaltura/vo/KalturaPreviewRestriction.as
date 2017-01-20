package com.borhan.vo
{
	import com.borhan.vo.BorhanSessionRestriction;

	[Bindable]
	public dynamic class BorhanPreviewRestriction extends BorhanSessionRestriction
	{
		public var previewLength : int = int.MIN_VALUE;
		override protected function setupPropertyList():void
		{
			super.setupPropertyList();
			propertyList.push('previewLength');
		}
		override public function getParamKeys():Array
		{
			var arr : Array;
			arr = super.getParamKeys();
			arr.push('previewLength');
			return arr;
		}

		override public function getUpdateableParamKeys():Array
		{
			var arr : Array;
			arr = super.getUpdateableParamKeys();
			arr.push('previewLength');
			return arr;
		}

	}
}
