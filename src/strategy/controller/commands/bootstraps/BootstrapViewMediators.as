package strategy.controller.commands.bootstraps
{
	import org.robotlegs.mvcs.Command;
	import strategy.PyramidGameView;
	import strategy.PyramidGameViewMediator;
	import strategy.view.decisions.StoneOfferView;
	import strategy.view.decisions.StoneOfferViewMediator; 
	import strategy.view.status.CalendarStatusView;
	import strategy.view.status.CalendarStatusViewMediator;
	import strategy.view.status.CashStatusView;
	import strategy.view.status.CashStatusViewMediator;
	import strategy.view.status.ProgressStatusView;
	import strategy.view.status.ProgressStatusViewMediator;
	import strategy.view.status.StoneStockStatusView;
	import strategy.view.status.StoneStockStatusViewMediator;
	import strategy.view.status.TeamStatusView;
	import strategy.view.status.TeamStatusViewMediator;
	import strategy.view.messages.DaySummaryView;
	import strategy.view.messages.DaySummaryViewMediator;
	import strategy.view.decisions.StoneDilemmaView;
	import strategy.view.decisions.NoStoneView;
	import strategy.view.decisions.NoStoneViewMediator;


	public class BootstrapViewMediators extends Command
	{
	
		override public function execute():void
		{
			mediatorMap.mapView(PyramidGameView, PyramidGameViewMediator);
			mediatorMap.mapView(ProgressStatusView, ProgressStatusViewMediator);
			mediatorMap.mapView(StoneStockStatusView, StoneStockStatusViewMediator);
		    mediatorMap.mapView(CashStatusView, CashStatusViewMediator);
			mediatorMap.mapView(TeamStatusView, TeamStatusViewMediator);
			mediatorMap.mapView(CalendarStatusView, CalendarStatusViewMediator);
			mediatorMap.mapView(StoneOfferView, StoneOfferViewMediator);
			mediatorMap.mapView(StoneDilemmaView, StoneOfferViewMediator, StoneOfferView);
			mediatorMap.mapView(NoStoneView, NoStoneViewMediator);
			mediatorMap.mapView(DaySummaryView, DaySummaryViewMediator);
		}
	
	}

}