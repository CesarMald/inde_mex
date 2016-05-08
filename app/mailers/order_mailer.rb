class OrderMailer < ApplicationMailer

  def send_confirmation order, user
    @order = order
    @line_items = order.line_items
    mail(to: user.email, subject: "Cotización ##{order.id}")
  end
end
