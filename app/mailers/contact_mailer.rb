class ContactMailer < ApplicationMailer

  def send_notification_to_admin name, email, phone, message
    @name  = name
    @email = email
    @phone = phone
    @message = message
    mail(to: "diegopulido@hotmail.com", subject: "Tienes una nueva notificación")
  end

end
