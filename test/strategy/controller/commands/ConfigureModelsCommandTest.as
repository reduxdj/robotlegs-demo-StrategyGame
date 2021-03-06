package strategy.controller.commands {

	import asunit.framework.TestCase;
	
	import org.robotlegs.mvcs.Command;
	import strategy.model.resources.IBuildingProgressModel;
	import strategy.model.resources.ICalendarModel;
	import strategy.model.resources.ICashModel;
	import strategy.model.IGameConfig;
	import strategy.model.resources.ILabourModel;
	import strategy.model.markets.ILabourPriceMarket;

	import asunit.errors.AssertionFailedError;     

	import mockolate.prepare;
	import mockolate.nice;
	import mockolate.stub;
   	import mockolate.verify;
	import mockolate.errors.VerificationError;
	
	import org.hamcrest.core.anything;
	import org.hamcrest.core.not;
	import org.hamcrest.object.equalTo;
	import org.hamcrest.object.nullValue;
	import org.hamcrest.object.strictlyEqualTo;
	import org.hamcrest.object.hasPropertyWithValue;
	
	import flash.events.Event;
	import flash.events.IEventDispatcher;
	import strategy.model.resources.IStoneSupplyModel;
	import strategy.model.markets.IStoneAvailabilityMarket;
	import strategy.model.markets.IStonePriceMarket;
	import strategy.controller.surprises.IStoneSurpriseEventCaster;
	import strategy.model.markets.ILabourAvailabilityMarket;
	import strategy.model.resources.IHealthAndSafetyModel;
	import strategy.model.resources.IEnvironmentalImpactModel;
	import strategy.controller.surprises.IDilemmaSurpriseEventCaster;

	public class ConfigureModelsCommandTest extends TestCase {
		private var instance:ConfigureModelsCommand;

		public function ConfigureModelsCommandTest(methodName:String=null) {
			super(methodName)
		}

		override public function run():void{
			var mockolateMaker:IEventDispatcher = prepare(IBuildingProgressModel, ICashModel, ICalendarModel, IGameConfig, ILabourPriceMarket, ILabourModel,IStoneSupplyModel, IStoneAvailabilityMarket, IStonePriceMarket, IStoneSurpriseEventCaster, ILabourAvailabilityMarket, IHealthAndSafetyModel, IEnvironmentalImpactModel, IDilemmaSurpriseEventCaster);
			mockolateMaker.addEventListener(Event.COMPLETE, prepareCompleteHandler);
		}

		private function prepareCompleteHandler(e:Event):void{
			IEventDispatcher(e.target).removeEventListener(Event.COMPLETE, prepareCompleteHandler);
			super.run();
		}

		override protected function setUp():void {
			super.setUp();
			instance = new ConfigureModelsCommand();
			instance.buildingProgress = nice(IBuildingProgressModel);
			instance.calendar = nice(ICalendarModel);
			instance.cash = nice(ICashModel);
			instance.gameConfig = nice(IGameConfig);
			instance.labour = nice(ILabourModel);
			instance.labourAvailabilityMarket = nice(ILabourAvailabilityMarket);
			instance.labourPriceMarket = nice(ILabourPriceMarket);
			instance.stoneStock = nice(IStoneSupplyModel);
			instance.stoneAvailabilityMarket = nice(IStoneAvailabilityMarket);
			instance.stonePriceMarket = nice(IStonePriceMarket);
			instance.stoneSurpriseEventCaster = nice(IStoneSurpriseEventCaster);
			instance.safety = nice(IHealthAndSafetyModel);
			instance.environmentalImpact = nice(IEnvironmentalImpactModel); 
			instance.dilemmaSurpriseEventCaster = nice(IDilemmaSurpriseEventCaster);
		}

		override protected function tearDown():void {
			super.tearDown();
			instance = null;
		}

		public function testInstantiated():void {
			assertTrue("instance is ConfigureModelsCommand", instance is ConfigureModelsCommand);
		}
		
		public function testIsCommand():void{
			assertTrue("instance is robotlegs Command", instance is Command);
		}

		public function testFailure():void {
			assertTrue("Failing test", true);
		}
		
		public function testExecute():void {
			assertTrue("Execute runs without error", (instance.execute() == void));
		}
	}
}