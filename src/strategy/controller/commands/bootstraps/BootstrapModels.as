package strategy.controller.commands.bootstraps
{
	import org.robotlegs.mvcs.Command;
	import strategy.model.IGameConfig;
	import strategy.model.FirstGameConfig;
	import strategy.model.resources.IBuildingProgressModel;
	import strategy.model.resources.BuildingProgressModel;
	import strategy.model.resources.ICalendarModel;
	import strategy.model.resources.CalendarModel;
	import strategy.model.resources.ICashModel;
	import strategy.model.resources.CashModel;
	import strategy.model.resources.ILabourModel;
	import strategy.model.resources.LabourModel;
	import strategy.model.markets.ILabourPriceMarket;
	import strategy.model.markets.LabourPriceMarket;
	import strategy.model.markets.ILabourAvailabilityMarket;
	import strategy.model.markets.LabourAvailabilityMarket;
	import strategy.model.resources.IStoneSupplyModel;
	import strategy.model.resources.StoneSupplyModel;
	import strategy.controller.surprises.IStoneSurpriseEventCaster;
	import strategy.controller.surprises.StoneSurpriseEventCaster;
	import strategy.model.markets.IStoneAvailabilityMarket;
	import strategy.model.markets.StoneAvailabilityMarket;
	import strategy.model.markets.IStonePriceMarket;
	import strategy.model.markets.StonePriceMarket;
	import strategy.controller.surprises.ILabourSurpriseEventCaster;
	import strategy.controller.surprises.LabourSurpriseEventCaster;
	import strategy.view.messages.IGameMessageText;
	import strategy.view.messages.GameMessageText;
	import org.robotlegs.core.IOptionCommandMapper;
	import org.robotlegs.mvcs.OptionCommandMapper;
	import strategy.model.resources.IEnvironmentalImpactModel;
	import strategy.model.resources.EnvironmentalImpactModel;
	import strategy.model.resources.IHealthAndSafetyModel;
	import strategy.model.resources.HealthAndSafetyModel;
	import strategy.controller.surprises.IDilemmaSurpriseEventCaster;
	import strategy.controller.surprises.DilemmaSurpriseEventCaster;
	import config.ISurprisesXMLImporter;
	import config.SurprisesXMLImporter;

	public class BootstrapModels extends Command
	{
	
		override public function execute():void
		{
			injector.mapSingletonOf(IOptionCommandMapper, OptionCommandMapper);
			
			injector.mapSingletonOf(IGameMessageText, GameMessageText);
			injector.mapSingletonOf(IGameConfig, FirstGameConfig);
			
			injector.mapSingletonOf(IBuildingProgressModel, BuildingProgressModel); 
			
			injector.mapSingletonOf(ICalendarModel, CalendarModel);
			
			injector.mapSingletonOf(ICashModel, CashModel);
			
			injector.mapSingletonOf(IEnvironmentalImpactModel, EnvironmentalImpactModel);
			injector.mapSingletonOf(IHealthAndSafetyModel, HealthAndSafetyModel);
			
			injector.mapSingletonOf(ILabourModel, LabourModel);
			injector.mapSingletonOf(ILabourPriceMarket, LabourPriceMarket);
			injector.mapSingletonOf(ILabourAvailabilityMarket, LabourAvailabilityMarket);
			
			injector.mapSingletonOf(IStoneSupplyModel, StoneSupplyModel);
			injector.mapSingletonOf(IStoneAvailabilityMarket, StoneAvailabilityMarket);
			injector.mapSingletonOf(IStonePriceMarket, StonePriceMarket);
			injector.mapSingletonOf(IStoneSurpriseEventCaster, StoneSurpriseEventCaster);
			
			injector.mapSingletonOf(ISurprisesXMLImporter, SurprisesXMLImporter);
			
			injector.mapSingletonOf(ILabourSurpriseEventCaster, LabourSurpriseEventCaster);
			injector.mapSingletonOf(IDilemmaSurpriseEventCaster, DilemmaSurpriseEventCaster);
		}
	
	} 

}