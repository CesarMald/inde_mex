class OrderMailer < ApplicationMailer

  def send_confirmation order, user
    @order = order
    @line_items = order.line_items
    if Rails.env.development?
      @server_name = ""
    else
      @server_name = "http://159.203.192.36/"
    end
    mail(to: user.email, subject: "Cotización ##{order.id}")
  end
end
