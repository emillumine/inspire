require 'test_helper'

class ReadingRecommendationsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get reading_recommendations_index_url
    assert_response :success
  end

end
