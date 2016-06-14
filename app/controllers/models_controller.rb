class ModelsController < AdminController
  before_action :set_model, only: [:show, :edit, :update, :destroy]

  # GET /models
  # GET /models.json
  def index
    @q = Model.ransack(params_q)
    @models = @q.result(distinct: true)
  end

  # GET /models/1
  # GET /models/1.json
  def show
  end

  # GET /models/new
  def new
    @model = Model.new
    @model.build_picture
  end

  # GET /models/1/edit
  def edit
    @model.build_picture unless @model.picture
  end

  # POST /models
  # POST /models.json
  def create
    @model = Model.new(model_params)

    respond_to do |format|
      if @model.save
        format.html { redirect_to models_path, notice: '¡Equipo creado exitosamente!' }
        format.json { render :show, status: :created, location: @model }
      else
        format.html { render :new }
        format.json { render json: @model.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /models/1
  # PATCH/PUT /models/1.json
  def update
    respond_to do |format|
      if @model.update(model_params)
        format.html { redirect_to models_path, notice: '¡Equipo actualizado exitosamente!' }
        format.json { render :show, status: :ok, location: @model }
      else
        format.html { render :edit }
        format.json { render json: @model.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /models/1
  # DELETE /models/1.json
  def destroy
    @model.destroy
    respond_to do |format|
      format.html { redirect_to models_url, notice: '¡Equipo eliminado exitosamente!' }
      format.json { head :no_content }
    end
  end

  def activate
    @model = Model.find(params[:id])
    if @model.can_be_activated?
      @model.update_attribute(:active, true)
      @model.products.update_all(active: true)
      flash[:notice] = "¡Equipo activado exitosamente!"
    else
      flash[:alert] = "Equipo no puede ser activado correctamente. Revise que su marca esté activada" 
    end
    redirect_to models_path
  end

  def deactivate
    @model = Model.find(params[:id])
    @model.update_attribute(:active, false)
    @model.products.update_all(active: false)
    flash[:notice] = "¡Equipo desactivado exitosamente!"
    redirect_to models_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_model
      @model = Model.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def model_params
      params.require(:model).permit(:name, :brand_id, picture_attributes: [:id, :image, :remote_image_url, :picturable_id, :picturable_type])
    end

    def params_q
      params[:q] ||= {}
      if params[:q].has_key? :active_false
        params[:q].delete(:active_false)
      else
        params[:q][:active_true] = 1
      end
      params[:q]
    end

end
