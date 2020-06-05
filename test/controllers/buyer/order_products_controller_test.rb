require 'test_helper'

class Buyer::OrderProductsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get buyer_order_products_new_url
    assert_response :success
  end

  test "should get create" do
    get buyer_order_products_create_url
    assert_response :success
  end

  test "should get destroy" do
    get buyer_order_products_destroy_url
    assert_response :success
  end

end
