class SimilarProductsController < AdminController
  before_action :find_product

  def index
    @q = @product.similar_products.ransack(params[:q])
    @similar_products = @q.result(distinct: true)
  end

  def new
    @brand = @product.brand
    @q = @brand.products.where.not(id: [@product.similar_product_ids, @product.id]).ransack(params[:q])
    @products = @q.result
  end

  def create
    product_params
    original_products = @product.similar_product_ids
    @similar_product_ids.concat(original_products)
    @product.similar_product_ids = @similar_product_ids.uniq
    flash[:notice] = "Productos asociados exitosamente"
    redirect_to product_similar_products_path(@product)
  end

  def destroy
    @similar_product = Product.find(params[:id])
    @product.similar_products.delete(@similar_product)
    flash[:notice] = "Asociación entre productos eliminada exitosamente"
    redirect_to product_similar_products_path(@product)
  end

  private

  def find_product
    @product = Product.find(params[:product_id])
  end

  def product_params
    @similar_product_ids ||= []
    params.each do |key, value|
      @similar_product_ids << value if key =~ /related/
    end
  end
end
