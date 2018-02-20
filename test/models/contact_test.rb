require 'test_helper'

class ContactControllerTest < ActionDispatch::IntegrationTest

  # previous test omitted 

  #test "POST create" do
    #post create_contact_url, params: {
     # message: {
     #   fname: 'chichi',
      #  email: 'ceze1990@gmail.com',
      #  message: 'hi'
      #}
    #}

    #assert_redirected_to new_contact_url

   # follow_redirect!

    #assert_match /Message received, thanks!/, response.body
  #end
  test "invalid POST create" do
    post create_contact_url, params: {
      contact: { name: '', email: '', message: '' }
    }

    assert_match /FName .* blank/, response.message
    assert_match /Email .* blank/, response.message
    assert_match /Message .* blank/, response.message
  end
end

