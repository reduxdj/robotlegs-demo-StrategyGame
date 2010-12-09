package strategy.controller.events {
	
	import flash.events.Event;
	
	public class DayCycleEvent extends Event {
		
		//--------------------------------------
		// CLASS CONSTANTS
		//--------------------------------------
		
		public static const NEW_DAY_STARTED:String = "DayCycleEvent.newDayStarted";
		public static const STONE_DELIVERY_COMPLETED:String = "DayCycleEvent.stoneDeliveryCompleted";
		public static const PROGRESS_CALCULATED:String = "DayCycleEvent.progressCalculated";
		public static const DAY_ENDED:String = "DayCycleEvent.dayEnded";                    
		
		//--------------------------------------
		//  CONSTRUCTOR
		//--------------------------------------

		/**
		 *	@constructor
		 */
		public function DayCycleEvent(type:String, bubbles:Boolean=true, cancelable:Boolean=false ){
			super(type, bubbles, cancelable);		
		}
		
		//--------------------------------------
		//  GETTER/SETTERS
		//--------------------------------------
		
		//--------------------------------------
		//  PUBLIC METHODS
		//--------------------------------------

		override public function clone() : Event {
			return new DayCycleEvent(type, bubbles, cancelable);
		}
		
		//--------------------------------------
		//  PRIVATE VARIABLES
		//--------------------------------------
		
	}
}
