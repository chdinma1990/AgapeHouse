# Preview all emails at http://localhost:3000/rails/mailers/message_mailer
class ContactMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/message_mailer/contact
  def contact
 contact = Contact.new name: 'marflar', 
                          email: 'marflar@example.org',
                          body: 'This is the body of the email'

    ContactMailer.contact_me message
  end

end
