package strategy.view.status {
	
	import skins.PyramidGameSkin;
	import strategy.view.status.BaseGaugeStatusView;
	
	public class EnvironmentStatusView extends BaseGaugeStatusView {
		
		
		//--------------------------------------------------------------------------
		//
		//  Initialization
		//
		//--------------------------------------------------------------------------
		/**
		 * Event handling takes place via the mediator: EnvironmentStatusViewMediator 
		 * 
		 */
		
		public function EnvironmentStatusView() {			
			init(PyramidGameSkin.EnvironmentStatusSkin);
		}
		
	}
}