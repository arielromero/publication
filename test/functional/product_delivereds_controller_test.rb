require 'test_helper'

class ProductDeliveredsControllerTest < ActionController::TestCase
  setup do
    @product_delivered = product_delivereds(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:product_delivereds)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create product_delivered" do
    assert_difference('ProductDelivered.count') do
      post :create, product_delivered: { delivered_at: @product_delivered.delivered_at, product_received_id: @product_delivered.product_received_id, subscription_id: @product_delivered.subscription_id, user_id: @product_delivered.user_id }
    end

    assert_redirected_to product_delivered_path(assigns(:product_delivered))
  end

  test "should show product_delivered" do
    get :show, id: @product_delivered
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @product_delivered
    assert_response :success
  end

  test "should update product_delivered" do
    put :update, id: @product_delivered, product_delivered: { delivered_at: @product_delivered.delivered_at, product_received_id: @product_delivered.product_received_id, subscription_id: @product_delivered.subscription_id, user_id: @product_delivered.user_id }
    assert_redirected_to product_delivered_path(assigns(:product_delivered))
  end

  test "should destroy product_delivered" do
    assert_difference('ProductDelivered.count', -1) do
      delete :destroy, id: @product_delivered
    end

    assert_redirected_to product_delivereds_path
  end
end
