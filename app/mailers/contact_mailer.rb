class ContactMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.message_mailer.contact.subject
  #
  def contact(contact)
    
    @message = contact.message

    mail to: "ceze1990@gmail.com", from: contact.email
  end
end
