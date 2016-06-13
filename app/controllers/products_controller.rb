class ProductsController < AdminController
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  # GET /products
  # GET /products.json
  def index
    @q = Product.order(created_at: :desc).ransack(params_q)
    @products = @q.result(distinct: true)
  end

  # GET /products/1
  # GET /products/1.json
  def show
  end

  # GET /products/new
  def new
    @product = Product.new
    @products = @product.related_products.build
  end

  # GET /products/1/edit
  def edit
    @pictures = @product.pictures
  end

  # POST /products
  # POST /products.json
  def create
    @product = Product.new(product_params)

    respond_to do |format|
      if @product.save
        format.html { redirect_to products_url, notice: '¡Producto creado exitosamente!' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update
    @pictures = @product.pictures
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to products_url, notice: '¡Producto actualizado exitosamente!' }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_url, notice: 'Product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def activate
    @product = Product.find(params[:id])
    @product.update_attribute(:active, true)
    flash[:notice] = "Producto activado exitosamente"
    redirect_to products_path
  end

  def deactivate
    @product = Product.find(params[:id])
    @product.update_attribute(:active, false)
    flash[:notice] = "Producto desactivado exitosamente"
    redirect_to products_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params[:product][:related_product_ids] ||= {}
      params[:product][:related_product_ids] = params[:product][:related_product_ids].values
      params.require(:product).permit(:model_id, :collection_id, :name, :code, :regular_price, :offer_price, :premium_price, :description, :merchant_price, :on_offer, related_product_ids: [])
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
