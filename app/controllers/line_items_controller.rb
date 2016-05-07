class LineItemsController < ApplicationController
   before_action :authenticate_user!
   before_action :find_current_cart

  def new
    @line_item = LineItem.new
  end

  # GET /line_items/1/edit
  def edit
  end

  # POST /line_items
  # POST /line_items.json
  def create
    @line_item = @order.line_items.new(line_item_params)
    @line_item.total = calculate_price
    if @line_item.save
      update_price_for_order
      flash[:notice] = "Producto agregado exitosamente"
    else
      flash[:error] = "Hubo un error :(. Por favor intenta de nuevo"
    end
    redirect_to product_section_path(@line_item.product)
  end

  # PATCH/PUT /line_items/1
  # PATCH/PUT /line_items/1.json
  def update
    respond_to do |format|
      if @line_item.update(line_item_params)
        format.html { redirect_to @line_item, notice: 'Line item was successfully updated.' }
        format.json { render :show, status: :ok, location: @line_item }
      else
        format.html { render :edit }
        format.json { render json: @line_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /line_items/1
  # DELETE /line_items/1.json
  def destroy
    @line_item.destroy
    respond_to do |format|
      format.html { redirect_to line_items_url, notice: 'Line item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def find_current_cart
    @order = Order.find(session[:cart_id])
  end

  def set_line_item
    @line_item = LineItem.find(params[:id])
  end

  def line_item_params
    params.require(:line_item).permit(:product_id, :order_id, :quantity, :total)
  end

  def calculate_price
    price = price_for_current_user
    price * @line_item.quantity
  end

  def price_for_current_user
    case
    when current_user.regular? then @line_item.product.offer_price
    when current_user.premium? then @line_item.product.premium_price
    end
  end

  def update_price_for_order
    subtotal = @order.line_items.sum(:total)
    iva = subtotal * 0.16
    @order.update_attribute(:total, subtotal + iva)
  end
end
