require "test_helper"

class WebPagesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get web_pages_index_url
    assert_response :success
  end
end
