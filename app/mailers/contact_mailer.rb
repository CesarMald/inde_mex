class ContactMailer < ApplicationMailer

  def send_notification_to_admin name, email, phone, message
    @name  = name
    @email = email
    @phone = phone
    @message = message
    @admin = find_admin_user
    mail(to: @admin.email, subject: "Tienes una nueva notificación")
  end

  private

  def find_admin_user
    User.find_by(role: "admin")
  end
end
