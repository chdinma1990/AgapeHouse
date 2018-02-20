require 'test_helper'

class EventListingControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get event_listing_index_url
    assert_response :success
  end

end
