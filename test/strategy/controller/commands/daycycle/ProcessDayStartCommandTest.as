package strategy.controller.commands.daycycle{

	import asunit.framework.TestCase;
	
	import org.robotlegs.mvcs.Command;
	import strategy.model.resources.ILabourModel;
	import strategy.model.markets.ILabourAvailabilityMarket;
	import strategy.model.markets.ILabourPriceMarket;
	import strategy.model.markets.IStoneAvailabilityMarket;
	import strategy.model.markets.IStonePriceMarket;

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
	import flash.events.EventDispatcher;
	import strategy.controller.events.DayCycleEvent;
	import strategy.model.resources.IHealthAndSafetyModel;
	import strategy.model.resources.IEnvironmentalImpactModel;
	import strategy.model.FirstGameConfig;

	public class ProcessDayStartCommandTest extends TestCase {
		private var instance:ProcessDayStartCommand;

		public function ProcessDayStartCommandTest(methodName:String=null) {
			super(methodName)
		}

		override public function run():void{
			var mockolateMaker:IEventDispatcher = prepare(ILabourModel, ILabourAvailabilityMarket, ILabourPriceMarket, IStonePriceMarket, IStoneAvailabilityMarket, IHealthAndSafetyModel, IEnvironmentalImpactModel);
			mockolateMaker.addEventListener(Event.COMPLETE, prepareCompleteHandler);
		}

		private function prepareCompleteHandler(e:Event):void{
			IEventDispatcher(e.target).removeEventListener(Event.COMPLETE, prepareCompleteHandler);
			super.run();
		}

		override protected function setUp():void {
			super.setUp();
			instance = new ProcessDayStartCommand();
			instance.eventDispatcher = new EventDispatcher();
			instance.labour = nice(ILabourModel);
			instance.labourAvailabilityMarket = nice(ILabourAvailabilityMarket);
			instance.labourPriceMarket = nice(ILabourPriceMarket);
			instance.stoneAvailabilityMarket = nice(IStoneAvailabilityMarket);
			instance.stonePriceMarket = nice(IStonePriceMarket);
			instance.safety = nice(IHealthAndSafetyModel);
			instance.environmentalImpact = nice(IEnvironmentalImpactModel)
		}

		override protected function tearDown():void {
			super.tearDown();
			instance = null;
		}

		public function testInstantiated():void {
			assertTrue("instance is ProcessDayStartCommand", instance is ProcessDayStartCommand);
		}
		
		public function testIsCommand():void{
			assertTrue("instance is robotlegs Command", instance is Command);
		}

		public function testFailure():void {
			assertTrue("Failing test", true);
		}
		
		public function testExecute():void {
			assertTrue("Execute returns void", (instance.execute() == void));
		}
		
		public function test_execute_dispatches_newDayStarted():void {
			var handler:Function = addAsync(check_execute_dispatches_newDayStarted, 50);
			instance.eventDispatcher.addEventListener(DayCycleEvent.NEW_DAY_STARTED, handler);
			
			instance.execute();
		}

		private function check_execute_dispatches_newDayStarted(e:DayCycleEvent):void {
			assertEquals('event is correct type', DayCycleEvent.NEW_DAY_STARTED, e.type);
			
		}
		
		
	}
}