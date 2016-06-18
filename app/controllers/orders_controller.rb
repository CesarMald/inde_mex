class OrdersController < AdminController
  before_action :set_order, only: [:show, :update]

  # GET /orders
  # GET /orders.json
  def index
    @q = Order.includes(:line_items).order("orders.created_at desc").ransack(ransack_params)
    @orders = @q.result(distinct: true)
  end

  def edit
    @order = Order.find(params[:id])
  end

  def update
    @order.update_attributes(order_params)
    @order.update_total
    flash[:notice] = "¡Orden actualizada exitosamente!"
    redirect_to order_path(@order)
  end

  # GET /orders/1
  # GET /orders/1.json
  def show
    @order.update_attribute(:seen, true) unless @order.seen
    @line_items = @order.line_items.includes(:product)
  end

  def destroy
    @order = Order.find(params[:id])
    @order.destroy
    flash[:notice] = "¡Orden eliminada exitosamente!"
    redirect_to orders_path
  end

  def complete
    @order = Order.find(params[:id])
    @order.update_attribute(:status, "completed")
    flash[:notice] = "¡Order completada exitosamente!"
    redirect_to orders_path
  end

  def send_to_client
    @order = Order.find(params[:id])
    flash[:notice] = "Se ha enviado la cotización correctamente"
    OrderMailer.send_confirmation(@order).deliver_now
    redirect_to orders_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_params
      params.require(:order).permit(:shipping_price, :tax_price, line_items_attributes: [:id, :quantity, :total] )
    end

    def ransack_params
      params[:q] ||= {}
      params[:q][:status_eq] ||= "in_progress"
      params[:q]
    end
end
