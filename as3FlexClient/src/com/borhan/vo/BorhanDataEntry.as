package com.borhan.vo
{
	import com.borhan.vo.BorhanBaseEntry;

	[Bindable]
	public dynamic class BorhanDataEntry extends BorhanBaseEntry
	{
		public var dataContent : String;
		override protected function setupPropertyList():void
		{
			super.setupPropertyList();
			propertyList.push('dataContent');
		}
		override public function getParamKeys():Array
		{
			var arr : Array;
			arr = super.getParamKeys();
			arr.push('dataContent');
			return arr;
		}

		override public function getUpdateableParamKeys():Array
		{
			var arr : Array;
			arr = super.getUpdateableParamKeys();
			arr.push('dataContent');
			return arr;
		}

	}
}
