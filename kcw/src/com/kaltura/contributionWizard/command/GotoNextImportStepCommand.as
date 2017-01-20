package com.borhan.contributionWizard.command
{
	import com.adobe_cw.adobe.cairngorm.control.CairngormEvent;
	import com.arc90.modular.ModuleSequenceCommand;
	import com.borhan.contributionWizard.enums.BCWWorkflowState;
	import com.borhan.contributionWizard.events.CategoryEvent;
	import com.borhan.contributionWizard.events.GotoNextImportStepEvent;
	import com.borhan.contributionWizard.events.ReportErrorEvent;
	import com.borhan.contributionWizard.events.WorkflowEvent;
	import com.borhan.contributionWizard.model.WizardModelLocator;
	import com.borhan.contributionWizard.model.WorkflowState;
	import com.borhan.contributionWizard.vo.ErrorVO;

	public class GotoNextImportStepCommand extends ModuleSequenceCommand
	{
		private var _model:WizardModelLocator = WizardModelLocator.getInstance();

		override public function execute(event:CairngormEvent):void
		{
			//collects categories info before going to tags view
			if (_model.workflowState == BCWWorkflowState.IMPORT_MEDIA) {
				var listCategories:CategoryEvent = new CategoryEvent(CategoryEvent.LIST_CATEGORIES);
				listCategories.dispatch();		
			}	
			
			var gotoNextStepEvent:GotoNextImportStepEvent  = GotoNextImportStepEvent(event);
			var currentStateName:String = _model.workflowState;

			var currentStateIndex:int;

			var currentWorkflowState:WorkflowState = _model.workflowStatesList.states.filter(
				function(importStep:WorkflowState, i:int, arr:Array):Boolean
				{
					if (importStep.name == currentStateName)
					{
						currentStateIndex = i;
						return true;
					}
					return false;
				}
			)[0];

			var direction:int = gotoNextStepEvent.backward ? -1 : 1;
			var nextStepIndex:int = currentStateIndex + direction;
			var nextStepEvent:CairngormEvent = WorkflowState(_model.workflowStatesList.states[nextStepIndex]).cairngormEvent;
			
			//REPORT TO BORHAN TO TRACE PROBLEMS WITH UPLOAD
			///////////////////////////////////////////////////
			var errorDescription : String = "currentState=" + _model.workflowStatesList.states[currentStateIndex].name;
			errorDescription += "&nextState=" + _model.workflowStatesList.states[nextStepIndex].name;
			var errorVo : ErrorVO = new ErrorVO();
			errorVo.reportingObj = "GotoNextImportStepCommand";
			errorVo.errorDescription = errorDescription;
			var errorEvent : ReportErrorEvent = new ReportErrorEvent( ReportErrorEvent.VIEW_STATE_CHANGE, errorVo);
			errorEvent.dispatch();
			///////////////////////////////////////////////////
			
			nextStepEvent.dispatch();
			/* if (gotoNextStepEvent.backward)
			{
				if (currentState == BCWWorkflowState.FINISH_SCREEN)
				{
					changeWorkflow(BCWWorkflowState.TAGGING);
				}
				else if (currentState == BCWWorkflowState.TAGGING)
				{
					changeWorkflow(BCWWorkflowState.IMPORT_MEDIA);
				}

			}
			else
			{
				if (currentState == BCWWorkflowState.IMPORT_MEDIA)
				{
					changeWorkflow(BCWWorkflowState.TAGGING);
				}
				else if (currentState == BCWWorkflowState.TAGGING)
				{
					var evtAddEntries:AddEntriesEvent = new AddEntriesEvent(AddEntriesEvent.ADD_ENTRIES);
					var clearState:ClearImportStateEvent = new ClearImportStateEvent(ClearImportStateEvent.CLEAR_IMPORT_STATE);

					var addEntriesAndClean:ChainEvent = EventChainFactory.chainEvents([evtAddEntries, clearState]);
					addEntriesAndClean.dispatch();
					//changeWorkflow(BCWWorkflowState.FINISH_SCREEN);
				}

			} */
		/* 	if (event.backward)
			{
				if (event.target == finishScreen)
				{
					changeWorkflow(BCWWorkflowState.TAGGING);
				}
				else if (event.target == taggingView)
				{
					changeWorkflow(BCWWorkflowState.IMPORT_MEDIA);
				}

			}
			else
			{
				if (event.target == importTypesView)
				{
					changeWorkflow(BCWWorkflowState.TAGGING);
				}
				else if (event.target == taggingView)
				{
					changeWorkflow(BCWWorkflowState.FINISH_SCREEN);
				}

			} */
		}

			private function changeWorkflow(state:String):void
			{
				var changeWorkflowEvent:WorkflowEvent = new WorkflowEvent(WorkflowEvent.CHANGE_WORKFLOW, state);
				changeWorkflowEvent.dispatch();
			}

	}
}