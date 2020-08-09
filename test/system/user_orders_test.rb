require "application_system_test_case"

class UserOrdersTest < ApplicationSystemTestCase
  setup do
    @user_order = user_orders(:one)
  end

  test "visiting the index" do
    visit user_orders_url
    assert_selector "h1", text: "User Orders"
  end

  test "creating a User order" do
    visit user_orders_url
    click_on "New User Order"

    fill_in "Amount", with: @user_order.amount
    fill_in "Order", with: @user_order.order_id
    fill_in "Payment mode", with: @user_order.payment_mode
    fill_in "Product", with: @user_order.product_id
    fill_in "Status", with: @user_order.status
    fill_in "User", with: @user_order.user_id
    click_on "Create User order"

    assert_text "User order was successfully created"
    click_on "Back"
  end

  test "updating a User order" do
    visit user_orders_url
    click_on "Edit", match: :first

    fill_in "Amount", with: @user_order.amount
    fill_in "Order", with: @user_order.order_id
    fill_in "Payment mode", with: @user_order.payment_mode
    fill_in "Product", with: @user_order.product_id
    fill_in "Status", with: @user_order.status
    fill_in "User", with: @user_order.user_id
    click_on "Update User order"

    assert_text "User order was successfully updated"
    click_on "Back"
  end

  test "destroying a User order" do
    visit user_orders_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "User order was successfully destroyed"
  end
end
