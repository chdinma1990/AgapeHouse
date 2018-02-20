require 'test_helper'

class SermonsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get sermons_index_url
    assert_response :success
  end

end
