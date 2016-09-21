require 'test_helper'

class SubscriptionsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get subscriptions_new_url
    assert_response :success
  end

  test "should get update" do
    get subscriptions_update_url
    assert_response :success
  end

end
