require 'test_helper'

class Admin::GiftTypesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @admin_gift_type = admin_gift_types(:one)
  end

  test "should get index" do
    get admin_gift_types_url
    assert_response :success
  end

  test "should get new" do
    get new_admin_gift_type_url
    assert_response :success
  end

  test "should create admin_gift_type" do
    assert_difference('Admin::GiftType.count') do
      post admin_gift_types_url, params: { admin_gift_type: { name: @admin_gift_type.name } }
    end

    assert_redirected_to admin_gift_type_url(Admin::GiftType.last)
  end

  test "should show admin_gift_type" do
    get admin_gift_type_url(@admin_gift_type)
    assert_response :success
  end

  test "should get edit" do
    get edit_admin_gift_type_url(@admin_gift_type)
    assert_response :success
  end

  test "should update admin_gift_type" do
    patch admin_gift_type_url(@admin_gift_type), params: { admin_gift_type: { name: @admin_gift_type.name } }
    assert_redirected_to admin_gift_type_url(@admin_gift_type)
  end

  test "should destroy admin_gift_type" do
    assert_difference('Admin::GiftType.count', -1) do
      delete admin_gift_type_url(@admin_gift_type)
    end

    assert_redirected_to admin_gift_types_url
  end
end
