require 'test_helper'

class ActiveTestControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get active_test_index_url
    assert_response :success
  end

  test "should get new" do
    get active_test_new_url
    assert_response :success
  end

  test "should get show" do
    get active_test_show_url
    assert_response :success
  end

end
