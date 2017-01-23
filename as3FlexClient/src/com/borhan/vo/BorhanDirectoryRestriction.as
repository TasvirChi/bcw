package com.borhan.vo
{
	import com.borhan.vo.BorhanBaseRestriction;

	[Bindable]
	public dynamic class BorhanDirectoryRestriction extends BorhanBaseRestriction
	{
		public var directoryRestrictionType : int = int.MIN_VALUE;
		override protected function setupPropertyList():void
		{
			super.setupPropertyList();
			propertyList.push('directoryRestrictionType');
		}
		override public function getParamKeys():Array
		{
			var arr : Array;
			arr = super.getParamKeys();
			arr.push('directoryRestrictionType');
			return arr;
		}

		override public function getUpdateableParamKeys():Array
		{
			var arr : Array;
			arr = super.getUpdateableParamKeys();
			arr.push('directoryRestrictionType');
			return arr;
		}

	}
}
