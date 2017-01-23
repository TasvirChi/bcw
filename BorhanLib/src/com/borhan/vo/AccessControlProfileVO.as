package com.borhan.vo
{
	import com.adobe.cairngorm.vo.IValueObject;
	import com.borhan.vo.BorhanAccessControl;
	import com.borhan.vo.BorhanBaseRestriction;
	import com.borhan.vo.BorhanCountryRestriction;
	import com.borhan.vo.BorhanDirectoryRestriction;
	import com.borhan.vo.BorhanPreviewRestriction;
	import com.borhan.vo.BorhanSessionRestriction;
	import com.borhan.vo.BorhanSiteRestriction;
	
	import flash.events.Event;
	
	import mx.utils.ObjectProxy;
	
	/**
	 * This class is a wrapper for the BorhanAccessControl VO.
	 * 
	 * 
	 * 
	 */	
	[Bindable]
	public class AccessControlProfileVO extends ObjectProxy implements IValueObject 
	{
		public static const SELECTED_CHANGED_EVENT : String = "accessControlSelectedChanged";
		/**
		 * marks if this object is selected in the UI controller 
		 */		
		private var _selected:Boolean = false;
		
		/**
		 *  BorhanAccessControl VO, hold all the profile properties
		 */		
		public var profile:BorhanAccessControl;
		
		/**
		 * Constructor 
		 * 
		 */				
		public function AccessControlProfileVO()
		{
			profile = new BorhanAccessControl();
		}
		
		/**
		 *  
		 * @return true if it was selected by the UI controller
		 * 
		 */		
		public function get selected():Boolean
		{
			return _selected;
		}
		
		/**
		 * set the selected parameter 
		 * @param selected - Boolean
		 * 
		 */		
		public function set selected(selected:Boolean):void
		{
			_selected = selected;
			dispatchEvent(new Event(SELECTED_CHANGED_EVENT));
		}
		
		/**
		 * Creates a AccessControlProfileVO  
		 * @return a new AccessControlProfileVO object
		 * 
		 */		
		public function clone():AccessControlProfileVO
		{
			var newAcp:AccessControlProfileVO = new AccessControlProfileVO();
			newAcp.selected = this.selected;
			newAcp.profile.name = this.profile.name.slice();
			newAcp.profile.description = this.profile.description.slice();
			newAcp.profile.createdAt = this.profile.createdAt;
			newAcp.profile.id = this.profile.id;
			newAcp.profile.isDefault = this.profile.isDefault;
			
			for each(var restriction:BorhanBaseRestriction in this.profile.restrictions)
			{
				if(restriction is BorhanSiteRestriction)
				{
					var ksr:BorhanSiteRestriction = new BorhanSiteRestriction();
					ksr.siteRestrictionType = (restriction as BorhanSiteRestriction).siteRestrictionType;
					ksr.siteList = (restriction as BorhanSiteRestriction).siteList;
					newAcp.profile.restrictions.push(ksr);
				}
				else if(restriction is BorhanCountryRestriction)
				{
					var kcr:BorhanCountryRestriction = new BorhanCountryRestriction();
					kcr.countryRestrictionType = (restriction as BorhanCountryRestriction).countryRestrictionType;
					kcr.countryList = (restriction as BorhanCountryRestriction).countryList;
					newAcp.profile.restrictions.push(kcr);
				}
				else if(restriction is BorhanPreviewRestriction)
				{
					var kpr:BorhanPreviewRestriction = new BorhanPreviewRestriction();
					kpr.previewLength = (restriction as BorhanPreviewRestriction).previewLength;
					newAcp.profile.restrictions.push(kpr);
				}
				else if(restriction is BorhanSessionRestriction)
				{
					var kser:BorhanSessionRestriction = new BorhanSessionRestriction();
					newAcp.profile.restrictions.push(kser);
				}
				else if(restriction is BorhanDirectoryRestriction)
				{
					var kdr:BorhanDirectoryRestriction = new BorhanDirectoryRestriction();
					kdr.directoryRestrictionType = (restriction as BorhanDirectoryRestriction).directoryRestrictionType;
					newAcp.profile.restrictions.push(kdr);
				}
			}

			
			return newAcp;
		}
	
	}
}