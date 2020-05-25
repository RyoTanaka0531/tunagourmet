require 'test_helper'

class Producer::OrdersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get producer_orders_index_url
    assert_response :success
  end

  test "should get show" do
    get producer_orders_show_url
    assert_response :success
  end

  test "should get update" do
    get producer_orders_update_url
    assert_response :success
  end

  test "should get confirm" do
    get producer_orders_confirm_url
    assert_response :success
  end

  test "should get completed" do
    get producer_orders_completed_url
    assert_response :success
  end

end
