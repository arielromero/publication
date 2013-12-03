require 'test_helper'

class ProductReceivedsControllerTest < ActionController::TestCase
  setup do
    @product_received = product_receiveds(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:product_receiveds)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create product_received" do
    assert_difference('ProductReceived.count') do
      post :create, product_received: { campaign_id: @product_received.campaign_id, description: @product_received.description, product_id: @product_received.product_id, received_at: @product_received.received_at, total: @product_received.total }
    end

    assert_redirected_to product_received_path(assigns(:product_received))
  end

  test "should show product_received" do
    get :show, id: @product_received
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @product_received
    assert_response :success
  end

  test "should update product_received" do
    put :update, id: @product_received, product_received: { campaign_id: @product_received.campaign_id, description: @product_received.description, product_id: @product_received.product_id, received_at: @product_received.received_at, total: @product_received.total }
    assert_redirected_to product_received_path(assigns(:product_received))
  end

  test "should destroy product_received" do
    assert_difference('ProductReceived.count', -1) do
      delete :destroy, id: @product_received
    end

    assert_redirected_to product_receiveds_path
  end
end
