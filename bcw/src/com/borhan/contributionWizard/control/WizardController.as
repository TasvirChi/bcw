/*
This file is part of the Borhan Collaborative Media Suite which allows users
to do with audio, video, and animation what Wiki platfroms allow them to do with
text.

Copyright (C) 2006-2008  Borhan Inc.

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU Affero General Public License as
published by the Free Software Foundation, either version 3 of the
License, or (at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU Affero General Public License for more details.

You should have received a copy of the GNU Affero General Public License
along with this program.  If not, see <http://www.gnu.org/licenses/>.

@ignore
*/
package com.borhan.contributionWizard.control
{
  import com.adobe_cw.adobe.cairngorm.control.FrontController;
  import com.borhan.contributionWizard.command.AddBatchTagsCommand;
  import com.borhan.contributionWizard.command.AddCreditsCommand;
  import com.borhan.contributionWizard.command.AddEntriesCommand;
  import com.borhan.contributionWizard.command.AddToImportCartCommand;
  import com.borhan.contributionWizard.command.CallExternalInterfaceCommand;
  import com.borhan.contributionWizard.command.CancelPendingRequestCommand;
  import com.borhan.contributionWizard.command.ChangeMediaProviderCommand;
  import com.borhan.contributionWizard.command.ChangePermissionLevelCommand;
  import com.borhan.contributionWizard.command.ChangeWorkflowCommand;
  import com.borhan.contributionWizard.command.CheckPartnerNotificationCommand;
  import com.borhan.contributionWizard.command.ClearImportStateCommand;
  import com.borhan.contributionWizard.command.CloseWizardCommand;
  import com.borhan.contributionWizard.command.GetWizardConfigCommand;
  import com.borhan.contributionWizard.command.GotoNextImportStepCommand;
  import com.borhan.contributionWizard.command.GotoScreenCommand;
  import com.borhan.contributionWizard.command.ListCategoriesCommand;
  import com.borhan.contributionWizard.command.LoadLocaleCommand;
  import com.borhan.contributionWizard.command.LoadStylesCommand;
  import com.borhan.contributionWizard.command.NotifyShellCommand;
  import com.borhan.contributionWizard.command.RemoveFromImportCartCommand;
  import com.borhan.contributionWizard.command.ReportErrorCommand;
  import com.borhan.contributionWizard.command.SaveInjectedDataCommand;
  import com.borhan.contributionWizard.command.SelectMediaTypeCommand;
  import com.borhan.contributionWizard.command.SendPartnerNotificationsCommand;
  import com.borhan.contributionWizard.command.SetDefaultScreenCommand;
  import com.borhan.contributionWizard.command.SetMetaDataCommand;
  import com.borhan.contributionWizard.command.ValidateAllMetaDataCommand;
  import com.borhan.contributionWizard.command.ValidateLimitationsCommand;
  import com.borhan.contributionWizard.command.ValidateMetaDataFieldCommand;
  import com.borhan.contributionWizard.events.AddEntriesEvent;
  import com.borhan.contributionWizard.events.BatchMetaDataEvent;
  import com.borhan.contributionWizard.events.CategoryEvent;
  import com.borhan.contributionWizard.events.ChangePermissionLevelEvent;
  import com.borhan.contributionWizard.events.ClearImportStateEvent;
  import com.borhan.contributionWizard.events.CloseWizardEvent;
  import com.borhan.contributionWizard.events.CreditsEvent;
  import com.borhan.contributionWizard.events.EntriesAddedEvent;
  import com.borhan.contributionWizard.events.ExternalInterfaceEvent;
  import com.borhan.contributionWizard.events.GotoNextImportStepEvent;
  import com.borhan.contributionWizard.events.GotoScreenEvent;
  import com.borhan.contributionWizard.events.ImportEvent;
  import com.borhan.contributionWizard.events.LoadUIEvent;
  import com.borhan.contributionWizard.events.MediaProviderEvent;
  import com.borhan.contributionWizard.events.MediaTypeSelectionEvent;
  import com.borhan.contributionWizard.events.NotifyAddEntriesCompleteCommand;
  import com.borhan.contributionWizard.events.NotifyShellEvent;
  import com.borhan.contributionWizard.events.PartnerNotificationsEvent;
  import com.borhan.contributionWizard.events.PendingActionEvent;
  import com.borhan.contributionWizard.events.ReportErrorEvent;
  import com.borhan.contributionWizard.events.SaveInjectedDataEvent;
  import com.borhan.contributionWizard.events.SetDefaultScreenEvent;
  import com.borhan.contributionWizard.events.TaggingEvent;
  import com.borhan.contributionWizard.events.ValidateAllMetaDataEvent;
  import com.borhan.contributionWizard.events.ValidateLimitationsEvent;
  import com.borhan.contributionWizard.events.ValidateMetaDataEvent;
  import com.borhan.contributionWizard.events.WizardConfigEvent;
  import com.borhan.contributionWizard.events.WorkflowEvent;

  public class WizardController extends FrontController
  {
    public function WizardController():void
    {
      initializeCommands();
    }

    public function initializeCommands() : void
    {   
      addCommand( SaveInjectedDataEvent.SAVE_INJECTED_DATA, 			SaveInjectedDataCommand );
      addCommand( WizardConfigEvent.GET_WIZARD_CONFIG, 					GetWizardConfigCommand );
      addCommand( MediaTypeSelectionEvent.MEDIA_TYPE_SELECT, 			SelectMediaTypeCommand)
      addCommand( MediaProviderEvent.MEDIA_PROVIDER_CHANGE,	 			ChangeMediaProviderCommand );
      addCommand( WorkflowEvent.CHANGE_WORKFLOW, 						ChangeWorkflowCommand );
      addCommand( ImportEvent.ADD_IMPORT_ITEM, 							AddToImportCartCommand );
      addCommand( ImportEvent.REMOVE_IMPORT_ITEM, 						RemoveFromImportCartCommand );
      addCommand( TaggingEvent.SET_MEDIA_META_DATA,	 					SetMetaDataCommand );
      addCommand( ValidateMetaDataEvent.VALIDATE_TAGS,	 				ValidateMetaDataFieldCommand);
      addCommand( ValidateMetaDataEvent.VALIDATE_TITLE,	 				ValidateMetaDataFieldCommand);
      addCommand( ValidateAllMetaDataEvent.VALIDATE_ALL_META_DATA,	 	ValidateAllMetaDataCommand);

      addCommand( BatchMetaDataEvent.ADD_BATCH_TAG,						AddBatchTagsCommand);
      addCommand( AddEntriesEvent.ADD_ENTRIES, 							AddEntriesCommand );
      addCommand( EntriesAddedEvent.NOTIFY_ADD_ENTRIES_COMPLETE,		NotifyAddEntriesCompleteCommand);

      addCommand( ExternalInterfaceEvent.CALL_EXTERNAL_INTERFACE,		CallExternalInterfaceCommand );
      addCommand( ClearImportStateEvent.CLEAR_IMPORT_STATE, 			ClearImportStateCommand );

      addCommand( PendingActionEvent.CANCEL_PENDING_ACTION,				CancelPendingRequestCommand );
      addCommand( NotifyShellEvent.ADD_ENTRY_NOTIFICATION,				NotifyShellCommand);
      addCommand( NotifyShellEvent.CLOSE_WIZARD_NOTIFICATION,			NotifyShellCommand);
      addCommand( NotifyShellEvent.WIZARD_READY_NOTIFICATION,			NotifyShellCommand);
      addCommand( NotifyShellEvent.PENDING,								NotifyShellCommand);

      addCommand( CreditsEvent.ADD_CREDITS,								AddCreditsCommand);

      addCommand( SetDefaultScreenEvent.SET_DEFAULT_SCREEN,				SetDefaultScreenCommand);
      addCommand( GotoScreenEvent.GOTO_SCREEN, 							GotoScreenCommand);
      addCommand( LoadUIEvent.LOAD_STYLE,								LoadStylesCommand);
      addCommand( LoadUIEvent.LOAD_LOCALE,								LoadLocaleCommand);
      addCommand( CloseWizardEvent.CLOSE_WIZARD,						CloseWizardCommand);
      addCommand( ChangePermissionLevelEvent.CHANGE_PERMISSION_LEVEL, 	ChangePermissionLevelCommand);

      addCommand(PartnerNotificationsEvent.CHECK_NOTIFICATIONS,			CheckPartnerNotificationCommand);
      addCommand(PartnerNotificationsEvent.SEND_NOTIFICATIONS,			SendPartnerNotificationsCommand);

	  // Categories Event
	  addCommand(CategoryEvent.LIST_CATEGORIES, 						ListCategoriesCommand );
      addCommand(GotoNextImportStepEvent.GOTO_NEXT_IMPORT_STEP,			GotoNextImportStepCommand);
      addCommand(ValidateLimitationsEvent.VALIDATE,						ValidateLimitationsCommand);
      
      //listen to Error Report Events
      addCommand(ReportErrorEvent.CANCEL_UPLOAD,						ReportErrorCommand);
      addCommand(ReportErrorEvent.VIEW_STATE_CHANGE,					ReportErrorCommand);
      addCommand(ReportErrorEvent.UPLOAD_SKIP,							ReportErrorCommand);
      addCommand(ReportErrorEvent.BEFORE_UPLOAD_FILE,					ReportErrorCommand);
      addCommand(ReportErrorEvent.AFTER_UPLOAD_FILE,					ReportErrorCommand);
      addCommand(ReportErrorEvent.UPLOAD_FAILED,						ReportErrorCommand);
      addCommand(ReportErrorEvent.UPLOAD_PROGRESS,						ReportErrorCommand);

    }
  }
}