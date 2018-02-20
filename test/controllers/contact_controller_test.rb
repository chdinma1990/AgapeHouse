require 'test_helper'

class ContactControllerTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  #test "GET new" do
   # get new_contact_url

   # assert_response :success

    #assert_select 'form' do 
     # assert_select 'input[type=text]'
     # assert_select 'input[type=email]'
     # assert_select 'textarea'
     # assert_select 'input[type=submit]'
    #end
  #end

  test "POST create" do
    assert_difference 'ActionMailer::Base.deliveries.size', 1 do
      post create_contact_url, params: {
        message: {
          name: 'cornholio',
          email: 'cornholio@example.org',
          body: 'hai'
        }
      }
    end

    assert_redirected_to new_contact_url

    follow_redirect!

    assert_match /Message received, thanks!/, response.message
  end

end
