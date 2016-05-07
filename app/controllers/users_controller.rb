class UsersController < AdminController
  before_action :set_user, only: [:show, :edit, :update, :destroy, :edit_password, :update_password]

  # GET /users
  # GET /users.json
  def index
    @q = User.ransack(params[:q])
    @users = @q.result(distinct: true)
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
    @user.build_picture
  end

  # GET /users/1/edit
  def edit
    @user.build_picture unless @user.picture
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to users_url, notice: 'User was successfully created.' }
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
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to users_url, notice: 'User was successfully updated.' }
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
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def edit_password
  end

  def update_password
    if @user.update_attributes(password_params)
      flash[:notice] = "Contraseña actualizada exitosamente"
      redirect_to users_path
    else
      render :edit_password
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :role, :status, :address, :company, :cell_phone, :phone_number, :hear_about_us, :subscribed_to_newsletter, picture_attributes: [:id, :image, :remote_image_url, :picturable_id, :picturable_type])
    end

    def password_params
      params.require(:user).permit(:password, :password_confirmation)
    end
end
