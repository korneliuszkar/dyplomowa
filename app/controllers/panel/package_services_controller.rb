class Panel::PackageServicesController < PanelController
  load_and_authorize_resource :package
  load_and_authorize_resource :package_service, through: :package

  # GET /package_services/new
  def new
    # @package_service = @package.package_services.build
  end

  # POST /package_services
  # POST /package_services.json
  def create
    # @package_service = @package.package_services.build(package_service_params)

    respond_to do |format|
      if @package_service.save
        format.html { redirect_to panel_package_path(@package), notice: 'Package service was successfully created.' }
        format.json { render :show, status: :created, location: @package_service }
      else
        format.html { render :new }
        format.json { render json: @package_service.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /package_services/1
  # DELETE /package_services/1.json
  def destroy
    @package_service.destroy
    respond_to do |format|
      format.html { redirect_to :back, notice: 'Package service was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    #  def set_package
    #   @package = Package.find(params[:package_id])
    # end
    # def set_package_service
    #   @package_service = @package.package_services.find(params[:id])
    # end

    # Never trust parameters from the scary internet, only allow the white list through.
    def package_service_params
      params.require(:package_service).permit(:service_id, :service_name)
    end
end
