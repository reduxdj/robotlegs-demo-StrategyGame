package strategy.view.status {
	
	import strategy.view.status.TeamStatusView;
	
	import org.robotlegs.mvcs.Mediator;
	import strategy.controller.events.ResourceStatusEvent;
	import strategy.controller.events.LabourSuspensionEvent;
	
	public class TeamStatusViewMediator extends Mediator {
		
		// declare the view to be injected
		[Inject]
		public var view:TeamStatusView;
		
		//--------------------------------------------------------------------------
		//
		//  Initialization
		//
		//--------------------------------------------------------------------------
		/**
		 * Avoid doing work in the constructor!
		 * onRegister() is the place to do things. 
		 * 
		 */
		
		public function TeamStatusViewMediator() {			
			// Try not to put stuff in the constructor of the mediator
		}
		
		//--------------------------------------------------------------------------
		//
		//  Overridden API
		//
		//--------------------------------------------------------------------------
		/**
		 * Initialize the view and register for events. 
		 * 
		 */
		override public function onRegister():void
		{			
			eventMap.mapListener(eventDispatcher, ResourceStatusEvent.TEAM_SIZE_UPDATED, teamSizeUpdatedHandler);
			eventMap.mapListener(eventDispatcher, LabourSuspensionEvent.WORKER_SUSPENSIONS_UPDATED, suspensionsUpdatedHandler);
		}
		
		//--------------------------------------------------------------------------
		//
		//  Event Handlers
		//
		//--------------------------------------------------------------------------
		
		public function teamSizeUpdatedHandler(e:ResourceStatusEvent):void
		{
			view.updateTeamSize(e.value);
		} 
		
		public function suspensionsUpdatedHandler(e:LabourSuspensionEvent):void
		{
			view.updateSuspensions(e.workerStatus);
		}
		
	}
}