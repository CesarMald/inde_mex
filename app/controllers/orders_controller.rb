class OrdersController < AdminController
  before_action :set_order, only: [:show]

  # GET /orders
  # GET /orders.json
  def index
    @q = Order.includes(:line_items).order("orders.created_at desc").ransack(ransack_params)
    @orders = @q.result(distinct: true)
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

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_params
      params.require(:order).permit(:total, :user_id)
    end

    def ransack_params
      params[:q] ||= {}
      params[:q][:status_eq] ||= "completed"
      params[:q]
    end
end
