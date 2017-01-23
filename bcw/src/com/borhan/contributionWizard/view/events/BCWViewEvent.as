package com.borhan.contributionWizard.view.events
{
	import flash.events.Event;

	public class BCWViewEvent extends Event
	{
		public static const CLOSE_WIZARD:String 		= "closeWizard";

		public function BCWViewEvent(type:String, bubbles:Boolean = true, cancelable:Boolean = false):void
		{
			super(type, bubbles, cancelable);
		}

		override public function clone():Event
		{
			return new BCWViewEvent(type, bubbles, cancelable);
		}
	}
}