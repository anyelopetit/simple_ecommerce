require 'test_helper'

class SellersPaymentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @sellers_payment = sellers_payments(:one)
  end

  test "should get index" do
    get sellers_payments_url
    assert_response :success
  end

  test "should get new" do
    get new_sellers_payment_url
    assert_response :success
  end

  test "should create sellers_payment" do
    assert_difference('SellersPayment.count') do
      post sellers_payments_url, params: { sellers_payment: { days_ago: @sellers_payment.days_ago, sellers_ids: @sellers_payment.sellers_ids } }
    end

    assert_redirected_to sellers_payment_url(SellersPayment.last)
  end

  test "should show sellers_payment" do
    get sellers_payment_url(@sellers_payment)
    assert_response :success
  end

  test "should get edit" do
    get edit_sellers_payment_url(@sellers_payment)
    assert_response :success
  end

  test "should update sellers_payment" do
    patch sellers_payment_url(@sellers_payment), params: { sellers_payment: { days_ago: @sellers_payment.days_ago, sellers_ids: @sellers_payment.sellers_ids } }
    assert_redirected_to sellers_payment_url(@sellers_payment)
  end

  test "should destroy sellers_payment" do
    assert_difference('SellersPayment.count', -1) do
      delete sellers_payment_url(@sellers_payment)
    end

    assert_redirected_to sellers_payments_url
  end
end
