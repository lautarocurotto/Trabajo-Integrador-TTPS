require "test_helper"

class LandscapeControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get landscape_new_url
    assert_response :success
  end

  test "should get create" do
    get landscape_create_url
    assert_response :success
  end
end
