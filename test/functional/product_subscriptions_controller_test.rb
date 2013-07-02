require 'test_helper'

class ProductSubscriptionsControllerTest < ActionController::TestCase
  setup do
    @product_subscription = product_subscriptions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:product_subscriptions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create product_subscription" do
    assert_difference('ProductSubscription.count') do
      post :create, :product_subscription => { :total => @product_subscription.total }
    end

    assert_redirected_to product_subscription_path(assigns(:product_subscription))
  end

  test "should show product_subscription" do
    get :show, :id => @product_subscription
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @product_subscription
    assert_response :success
  end

  test "should update product_subscription" do
    put :update, :id => @product_subscription, :product_subscription => { :total => @product_subscription.total }
    assert_redirected_to product_subscription_path(assigns(:product_subscription))
  end

  test "should destroy product_subscription" do
    assert_difference('ProductSubscription.count', -1) do
      delete :destroy, :id => @product_subscription
    end

    assert_redirected_to product_subscriptions_path
  end
end
