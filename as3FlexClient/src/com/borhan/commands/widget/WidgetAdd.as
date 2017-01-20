package com.borhan.commands.widget
{
	import com.borhan.vo.BorhanWidget;
	import com.borhan.delegates.widget.WidgetAddDelegate;
	import com.borhan.net.BorhanCall;

	public class WidgetAdd extends BorhanCall
	{
		public var filterFields : String;
		public function WidgetAdd( widget : BorhanWidget )
		{
			service= 'widget';
			action= 'add';

			var keyArr : Array = new Array();
			var valueArr : Array = new Array();
			var keyValArr : Array = new Array();
 			keyValArr = borhanObject2Arrays(widget,'widget');
			keyArr = keyArr.concat( keyValArr[0] );
			valueArr = valueArr.concat( keyValArr[1] );
			applySchema( keyArr , valueArr );
		}

		override public function execute() : void
		{
			setRequestArgument('filterFields',filterFields);
			delegate = new WidgetAddDelegate( this , config );
		}
	}
}
