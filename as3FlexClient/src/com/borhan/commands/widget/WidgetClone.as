package com.borhan.commands.widget
{
	import com.borhan.vo.BorhanWidget;
	import com.borhan.delegates.widget.WidgetCloneDelegate;
	import com.borhan.net.BorhanCall;

	public class WidgetClone extends BorhanCall
	{
		public var filterFields : String;
		public function WidgetClone( widget : BorhanWidget )
		{
			service= 'widget';
			action= 'clone';

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
			delegate = new WidgetCloneDelegate( this , config );
		}
	}
}
