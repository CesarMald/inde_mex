class LineItemsController < ApplicationController
   before_action :authenticate_user!
   before_action :find_current_cart


  # POST /line_items
  # POST /line_items.json
  def create
    @line_item = @order.line_items.new(line_item_params)
    @line_item.price = price_for_current_user
    @line_item.total = calculate_price(@line_item.quantity)
    if @line_item.save
      update_price_for_order
      flash[:notice] = "Producto agregado exitosamente"
    else
      flash[:alert] = "Hubo un error :(. Por favor intenta de nuevo"
    end
    redirect_to product_section_path(@line_item.product)
  end

  # PATCH/PUT /line_items/1
  # PATCH/PUT /line_items/1.json
  def update
    @line_item = @order.line_items.find(params[:id])
    @line_item.total = calculate_price(params[:line_item][:quantity].to_i)
    if @line_item.update_attributes(line_item_update_attributes)
      update_price_for_order
    end
  end

  # DELETE /line_items/1
  # DELETE /line_items/1.json
  def destroy
    @line_item = @order.line_items.find(params[:id])
    @line_item.destroy
    update_price_for_order
    flash[:notice] = "¡Producto eliminado exitosamente!"
    redirect_to detail_cart_path(@order) 
  end

  private

  def find_current_cart
    @order = Order.find(session[:cart_id])
  end

  def set_line_item
    @line_item = @order.line_item.find(params[:id])
  end

  def line_item_params
    params.require(:line_item).permit(:product_id, :order_id, :quantity)
  end

  def calculate_price quantity
    @line_item.price * quantity
  end

  def price_for_current_user
    if current_user.regular?
      @line_item.product.merchant_price
    else
      @line_item.product.premium_price
    end
  end

  def update_price_for_order
    subtotal = @order.line_items.sum(:total)
    @order.update_attributes(subtotal: subtotal, total: subtotal)
  end

  def line_item_update_attributes
    params.require(:line_item).permit(:quantity)
  end
end
