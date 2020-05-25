require 'test_helper'

class Buyer::OrdersControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get buyer_orders_new_url
    assert_response :success
  end

  test "should get create" do
    get buyer_orders_create_url
    assert_response :success
  end

  test "should get confirm" do
    get buyer_orders_confirm_url
    assert_response :success
  end

  test "should get completed" do
    get buyer_orders_completed_url
    assert_response :success
  end

  test "should get index" do
    get buyer_orders_index_url
    assert_response :success
  end

  test "should get show" do
    get buyer_orders_show_url
    assert_response :success
  end

  test "should get update" do
    get buyer_orders_update_url
    assert_response :success
  end

end
