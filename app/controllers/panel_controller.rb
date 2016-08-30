class PanelController < ApplicationController
	before_action :authenticate_user!
  layout "sandstone"
end
