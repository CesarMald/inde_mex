class OrderMailer < ApplicationMailer

  def send_confirmation order, user
    @order = order
    @line_items = order.line_items
    if Rails.env.development?
      @server_name = ""
    else
      @server_name = "http://ec2-54-213-190-137.us-west-2.compute.amazonaws.com/"
    end
    mail(to: user.email, subject: "Cotización ##{order.id}")
  end
end
