require 'test_helper'

class BuyersControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get buyers_show_url
    assert_response :success
  end

  test "should get edit" do
    get buyers_edit_url
    assert_response :success
  end

  test "should get update" do
    get buyers_update_url
    assert_response :success
  end

  test "should get quit" do
    get buyers_quit_url
    assert_response :success
  end

  test "should get index" do
    get buyers_index_url
    assert_response :success
  end

end
