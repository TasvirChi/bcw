@echo off

cd "C:\bcw\Locales_Borhan_ContributionWizard"

mxmlc -locale=en_US -source-path=locale/{locale} -include-resource-bundles=CairngormMessages,Errors,FinishScreen,ImportBrowser,ImportModuleLoader,IntroScreen,MediaTypes,PendingMessages,SearchAuthenticationScreen,SearchImportView,Tagging,TermsOfUseScreen,UploadImportView,WebcamView,SoundRecorderView,collections,containers,controls,core,effects,logging,messaging,rpc,skins,states,styles,SharedResources,PendingMessages,PermissionLevels,MediaProviders -output=en_US_ContributionWizard_borhan.swf