require 'test_helper'

class WatchingRecommendationsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get watching_recommendations_index_url
    assert_response :success
  end

end
