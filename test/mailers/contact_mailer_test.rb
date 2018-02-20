require 'test_helper'

class ContactMailerTest < ActionMailer::TestCase
  test "contact" do
    #mail = ContactMailer.contact
    #assert_equal "Contact", mail.subject

   contact = Contact.new name: 'chichi',
              email: 'nonsowinner@gmail.com',
              message: 'hi?'

     email = ContactMailer.contact(contact)

    assert_emails 1 do
      email.deliver_now
    end

    assert_equal 'Message from rccgagapehouse.org', email.subject
    assert_equal ["ceze1990@gmail.com"], mail.to
    assert_equal ["nonsowinner@gmail.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
