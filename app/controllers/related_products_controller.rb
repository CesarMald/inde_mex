class RelatedProductsController < AdminController
  before_action :find_product

  def index
    @q = @product.related_products.ransack(params[:q])
    @related_products = @q.result(distinct: true)
  end

  def new
    @q = Product.where.not(id: @product.related_product_ids).ransack(params[:q])
    @products = @q.result(distinct: true)
  end

  def create
    product_params
    original_products = @product.related_product_ids
    @related_product_ids.concat(original_products)
    @product.related_product_ids = @related_product_ids.uniq
    flash[:notice] = "Productos asociados exitosamente"
    redirect_to product_related_products_path(@product)
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
    @related_product_ids ||= []
    params.each do |key, value|
      @related_product_ids << value if key =~ /related/
    end
  end

end
