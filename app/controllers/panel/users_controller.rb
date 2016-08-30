class Panel::UsersController < PanelController
  load_and_authorize_resource :user
  #before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /users
  # GET /users.json
  def index
    @users = User.all
    respond_to do |format|
      format.html # index.html.erb
    end
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.find(params[:id])
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to panel_user_path(@user), notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    self_update = true if @user.id == current_user.id
    respond_to do |format|
      if @user.update(user_params_update)
        bypass_sign_in(@user) if self_update
        format.html { redirect_to panel_user_path, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to :back, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    # def set_user
    #   @user = User.find(params[:id])
    # end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:name, :email, :password, :role, :password_confirmation)
    end
    def user_params_update
      params[:user].delete(:password) if params[:user][:password].blank?
      params[:user].delete(:password_confirmation) if params[:user][:password_confirmation].blank?
      permit_params = [:name, :email, :role]
      if current_user.id == @user.id
        permit_params << :password
        permit_params << :password_confirmation
      end
      # params[:user].delete(:password) if params[:user][:password].blank?
      # params[:user].delete(:password_confirmation) if params[:user][:password_confirmation].blank?
      params.require(:user).permit(permit_params)
      # params.require(:user).permit(:name, :email, :password, :role, :password_confirmation)
    end
end
