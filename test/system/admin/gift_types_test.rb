require "application_system_test_case"

class Admin::GiftTypesTest < ApplicationSystemTestCase
  setup do
    @admin_gift_type = admin_gift_types(:one)
  end

  test "visiting the index" do
    visit admin_gift_types_url
    assert_selector "h1", text: "Admin/Gift Types"
  end

  test "creating a Gift type" do
    visit admin_gift_types_url
    click_on "New Admin/Gift Type"

    fill_in "Name", with: @admin_gift_type.name
    click_on "Create Gift type"

    assert_text "Gift type was successfully created"
    click_on "Back"
  end

  test "updating a Gift type" do
    visit admin_gift_types_url
    click_on "Edit", match: :first

    fill_in "Name", with: @admin_gift_type.name
    click_on "Update Gift type"

    assert_text "Gift type was successfully updated"
    click_on "Back"
  end

  test "destroying a Gift type" do
    visit admin_gift_types_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Gift type was successfully destroyed"
  end
end
