require 'test_helper'

class RecommendationsControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get recommendations_home_url
    assert_response :success
  end

end
