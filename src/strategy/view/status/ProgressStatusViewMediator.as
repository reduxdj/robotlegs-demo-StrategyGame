package strategy.view.status {
	
	import strategy.view.status.ProgressStatusView;
	
	import org.robotlegs.mvcs.Mediator;
	import strategy.controller.events.ResourceStatusEvent;
	
	public class ProgressStatusViewMediator extends Mediator {
		
		// declare the view to be injected
		[Inject]
		public var view:ProgressStatusView;
		
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
		
		public function ProgressStatusViewMediator() {			
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
			eventMap.mapListener(eventDispatcher, ResourceStatusEvent.BUILDING_PROGRESS_UPDATED, updateHandler);
		}
		
		//--------------------------------------------------------------------------
		//
		//  Event Handlers
		//
		//--------------------------------------------------------------------------
		
		private function updateHandler(e:ResourceStatusEvent):void
		{
			view.updateStatus(e.percentage);
		}
	}
}