class Panel::DashboardController < PanelController
  load_and_authorize_resource :panel
  def index
  end
end
