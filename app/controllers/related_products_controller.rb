class RelatedProductsController < AdminController
  before_action :find_product

  def index
    @q = @product.related_products.ransack(params[:q])
    @related_products = @q.result(distinct: true)
  end

  def new
    @q = Product.ransack(params[:q])
    @products = @q.result(distinct: true)
  end

  def create
    if @product.update(product_params)
      flash[:notice] = "Productos asociados exitosamente"
      redirect_to product_related_products_path(@product)
    else
      render :new
    end
  end

  def destroy
    @related_product = Product.find(params[:id])
    @product.related_products.delete(@related_product)
    flash[:notice] = "Asociación entre productos eliminada exitosamente"
    redirect_to product_related_products_path(@product)
  end


  private

  def find_product
    @product = Product.find(params[:product_id])
  end

  def product_params
    params[:product][:related_product_ids] ||= {}
    params[:product][:related_product_ids] = params[:product][:related_product_ids].values
  end
end
