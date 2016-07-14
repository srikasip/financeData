require 'test_helper'

class StockIntervalsControllerTest < ActionController::TestCase
  setup do
    @stock_interval = stock_intervals(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:stock_intervals)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create stock_interval" do
    assert_difference('StockInterval.count') do
      post :create, stock_interval: { close: @stock_interval.close, interval: @stock_interval.interval, open: @stock_interval.open, percChange: @stock_interval.percChange, ticker: @stock_interval.ticker, volume: @stock_interval.volume }
    end

    assert_redirected_to stock_interval_path(assigns(:stock_interval))
  end

  test "should show stock_interval" do
    get :show, id: @stock_interval
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @stock_interval
    assert_response :success
  end

  test "should update stock_interval" do
    patch :update, id: @stock_interval, stock_interval: { close: @stock_interval.close, interval: @stock_interval.interval, open: @stock_interval.open, percChange: @stock_interval.percChange, ticker: @stock_interval.ticker, volume: @stock_interval.volume }
    assert_redirected_to stock_interval_path(assigns(:stock_interval))
  end

  test "should destroy stock_interval" do
    assert_difference('StockInterval.count', -1) do
      delete :destroy, id: @stock_interval
    end

    assert_redirected_to stock_intervals_path
  end
end
