package com.borhan.vo
{
	import com.borhan.vo.BorhanBaseRestriction;

	[Bindable]
	public dynamic class BorhanSessionRestriction extends BorhanBaseRestriction
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
