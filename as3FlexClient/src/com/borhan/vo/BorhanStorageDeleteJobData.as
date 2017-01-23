package com.borhan.vo
{
	import com.borhan.vo.BorhanStorageJobData;

	[Bindable]
	public dynamic class BorhanStorageDeleteJobData extends BorhanStorageJobData
	{
		override protected function setupPropertyList():void
		{
			super.setupPropertyList();
		}
		override public function getParamKeys():Array
		{
			var arr : Array;
			arr = super.getParamKeys();
			return arr;
		}

		override public function getUpdateableParamKeys():Array
		{
			var arr : Array;
			arr = super.getUpdateableParamKeys();
			return arr;
		}

	}
}
