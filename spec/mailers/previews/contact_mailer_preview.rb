# Preview all emails at http://localhost:3000/rails/mailers/contact_mailer
class ContactMailerPreview < ActionMailer::Preview

  def send_notification_to_admin
    ContactMailer.send_notification_to_admin("Carlos", "ca.escalera@gmail.com", "8110131415", "Estoy interesado en tus productos.")
  end
end
