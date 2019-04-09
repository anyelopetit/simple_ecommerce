require "application_system_test_case"

class SellersPaymentsTest < ApplicationSystemTestCase
  setup do
    @sellers_payment = sellers_payments(:one)
  end

  test "visiting the index" do
    visit sellers_payments_url
    assert_selector "h1", text: "Sellers Payments"
  end

  test "creating a Sellers payment" do
    visit sellers_payments_url
    click_on "New Sellers Payment"

    fill_in "Days ago", with: @sellers_payment.days_ago
    fill_in "Sellers ids", with: @sellers_payment.sellers_ids
    click_on "Create Sellers payment"

    assert_text "Sellers payment was successfully created"
    click_on "Back"
  end

  test "updating a Sellers payment" do
    visit sellers_payments_url
    click_on "Edit", match: :first

    fill_in "Days ago", with: @sellers_payment.days_ago
    fill_in "Sellers ids", with: @sellers_payment.sellers_ids
    click_on "Update Sellers payment"

    assert_text "Sellers payment was successfully updated"
    click_on "Back"
  end

  test "destroying a Sellers payment" do
    visit sellers_payments_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Sellers payment was successfully destroyed"
  end
end
