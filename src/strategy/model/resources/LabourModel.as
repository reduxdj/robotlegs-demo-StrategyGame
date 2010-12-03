package strategy.model.resources {
	
	import org.robotlegs.mvcs.Actor;
	import strategy.model.base.GameFactorModel;
	import strategy.model.resources.IWorker;
	import strategy.model.base.IMarketVariationModel;
	import strategy.model.base.MarketVariationModel;
	import strategy.model.markets.ILabourPriceMarket;
	import strategy.controller.events.ResourceStatusEvent;
	
	public class LabourModel extends MarketVariationModel implements ILabourModel {
		
		protected var _team:Vector.<IWorker>;
		
		protected var _labourPriceMarket:ILabourPriceMarket;
		
		public function LabourModel() {
		}            
		
		//---------------------------------------
		// ILabourModel Implementation
		//---------------------------------------

		//import strategy.model.resources.ILabourModel;
		public function get teamSize():uint
		{
			return team.length;
		}

		public function set teamSize(value:uint):void
		{
			if(value != team.length)
			{
				adjustTeamSize(value);
				var evt:ResourceStatusEvent = new ResourceStatusEvent(ResourceStatusEvent.TEAM_SIZE_UPDATED, value, 0);
				dispatch(evt);
			}
		}

		public override function get currentValue():Number
		{
		    var totalBuilt:Number = 0;
			var iLength:uint = team.length;
			for (var i:int = 0; i < iLength; i++)
			{
				var nextWorker:IWorker = team[i];
				totalBuilt += nextWorker.currentValue;
			}
			
			return totalBuilt;
		}
		
		public override function move():void
		{
			var iLength:uint = team.length;
			for (var i:int = 0; i < iLength; i++)
		   	{
		   		var nextWorker:IWorker = team[i];
				configureWorker(nextWorker);
				nextWorker.move();
		   	}
		}
		
		public function get team():Vector.<IWorker>
		{
			return _team ||= new Vector.<IWorker>();
		}
		
		public function get teamCost():Number
		{
			var totalCost:Number = 0;
			var iLength:uint = team.length;
			for (var i:int = 0; i < iLength; i++)
			{
			    var nextWorker:IWorker = team[i];
		   		totalCost += nextWorker.pay;
			}
			
			return totalCost;
		}
		                                                          
		[Inject]
		public function set labourPriceMarket(value:ILabourPriceMarket):void
		{
			_labourPriceMarket = value;
		}
		
		
		protected function adjustTeamSize(requiredTeamSize:uint):void
		{
			while(team.length > requiredTeamSize)
			{
				team.pop();
			}
			while(team.length < requiredTeamSize)
			{
				team.push(newWorker);
			}
		}
		
		protected function get newWorker():IWorker
		{
			var worker:IWorker = new Worker();
			configureWorker(worker);
			worker.pay = _labourPriceMarket.currentValue;
			worker.energyLevel = 100; 
			
			return worker;
		}
		
		protected function configureWorker(worker:IWorker):void
		{
			worker.max = this.max;
			worker.min = this.min;
			worker.volatility = this.volatility;
		}   
		
		                     
	}
}