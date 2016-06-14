class BrandsController < AdminController 
  before_action :set_brand, only: [:show, :edit, :update, :destroy]

  # GET /brands
  # GET /brands.json
  def index
    @q = Brand.ransack(params_q)
    @brands = @q.result(distinct: true)
  end

  # GET /brands/1
  # GET /brands/1.json
  def show
  end

  # GET /brands/new
  def new
    @brand = Brand.new
  end

  # GET /brands/1/edit
  def edit
  end

  # POST /brands
  # POST /brands.json
  def create
    @brand = Brand.new(brand_params)

    respond_to do |format|
      if @brand.save
        format.html { redirect_to brands_path, notice: 'Brand was successfully created.' }
        format.json { render :show, status: :created, location: @brand }
      else
        format.html { render :new }
        format.json { render json: @brand.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /brands/1
  # PATCH/PUT /brands/1.json
  def update
    respond_to do |format|
      if @brand.update(brand_params)
        format.html { redirect_to brands_path, notice: 'Brand was successfully updated.' }
        format.json { render :show, status: :ok, location: @brand }
      else
        format.html { render :edit }
        format.json { render json: @brand.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /brands/1
  # DELETE /brands/1.json
  def destroy
    @brand.destroy
    respond_to do |format|
      format.html { redirect_to brands_url, notice: 'Brand was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def search_models
    @brand = Brand.find(params[:id])
    @models = @brand.models.map { |model| [model.name.titleize, model.id] }
  end

  def activate
    @brand = Brand.find(params[:id])
    @brand.update_attribute(:active, true)
    @brand.models.update_all(active: true)
    @brand.products.update_all(active: true)
    flash[:notice] = "¡Marca activada exitosamente!"
    redirect_to brands_path
  end

  def deactivate
    @brand = Brand.find(params[:id])
    @brand.update_attribute(:active, false)
    @brand.models.update_all(active: false)
    @brand.products.update_all(active: false)
    flash[:notice] = "¡Marca desactivada exitosamente!"
    redirect_to brands_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_brand
      @brand = Brand.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def brand_params
      params.require(:brand).permit(:name)
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
