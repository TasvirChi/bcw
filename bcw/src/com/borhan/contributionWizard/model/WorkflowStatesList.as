package com.borhan.contributionWizard.model
{
	import com.bjorn.event.ChainEvent;
	import com.borhan.contributionWizard.enums.BCWWorkflowState;
	import com.borhan.contributionWizard.events.AddEntriesEvent;
	import com.borhan.contributionWizard.events.WorkflowEvent;

	import flash.events.MouseEvent;

	public class WorkflowStatesList
	{
		public function WorkflowStatesList(enableIntroScreen:Boolean, enableTagging:Boolean, enableFinishScreen:Boolean):void
		{
			var introScreen:WorkflowState = new WorkflowState(BCWWorkflowState.INTRO_SCREEN, 		new WorkflowEvent(WorkflowEvent.CHANGE_WORKFLOW, BCWWorkflowState.INTRO_SCREEN));
			var importMedia:WorkflowState = new WorkflowState(BCWWorkflowState.IMPORT_MEDIA, 		new WorkflowEvent(WorkflowEvent.CHANGE_WORKFLOW, BCWWorkflowState.IMPORT_MEDIA));
			var taggingScreen:WorkflowState = new WorkflowState(BCWWorkflowState.TAGGING,			new WorkflowEvent(WorkflowEvent.CHANGE_WORKFLOW, BCWWorkflowState.TAGGING));
			var addEntrieshEvent:WorkflowState = new WorkflowState(BCWWorkflowState.ADD_ENTRIES,	new AddEntriesEvent(AddEntriesEvent.ADD_ENTRIES));
			var finishScreenEvent:WorkflowState = new WorkflowState(BCWWorkflowState.FINISH_SCREEN, new WorkflowEvent(WorkflowEvent.CHANGE_WORKFLOW, BCWWorkflowState.FINISH_SCREEN));

			states = [introScreen, importMedia, taggingScreen, addEntrieshEvent, finishScreenEvent];

			if (!enableIntroScreen)
				removeStateByName(BCWWorkflowState.INTRO_SCREEN);

			if (!enableTagging)
				removeStateByName(BCWWorkflowState.TAGGING);

			if (!enableFinishScreen)
				removeStateByName(BCWWorkflowState.FINISH_SCREEN);

			mergeStates();
		}
		public var states:Array;

		public function getStateByName(stateName:String):WorkflowState
		{
			return states.filter(
				function statesNameFilter(state:WorkflowState, i:int, list:Array):Boolean
				{
					return state.name == stateName;
				}
			)[0];
		}

		private function removeStateByName(name:String):void
		{
			var state:WorkflowState = getStateByName(name);
			var stateIndex:int = states.indexOf(state);
			states.splice(stateIndex, 1);
		}

		/**
		 * Adds a nextEvent to the AddEntriesEvent if exists (currently only WorkflowEvent that navigates to the finish screen)
		 *
		 */
		private function mergeStates():void
		{
			var addEntriesState:WorkflowState = getStateByName(BCWWorkflowState.ADD_ENTRIES);
			var addEntriesIndex:int = states.indexOf(addEntriesState);
			var nextState:WorkflowState =  addEntriesIndex < states.length - 1 ? states[addEntriesIndex + 1] : null;

			var addEntriesEvent:ChainEvent = ChainEvent(addEntriesState.cairngormEvent);
			addEntriesEvent.nextChainedEvent = nextState ? ChainEvent(nextState.cairngormEvent) : null;
			addEntriesState.cairngormEvent = addEntriesEvent;
		}

	}
}