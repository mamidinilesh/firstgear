require 'test_helper'

class VendorTypesControllerTest < ActionDispatch::IntegrationTest
  test "should get _form" do
    get vendor_types__form_url
    assert_response :success
  end

  test "should get edit" do
    get vendor_types_edit_url
    assert_response :success
  end

  test "should get index" do
    get vendor_types_index_url
    assert_response :success
  end

  test "should get new" do
    get vendor_types_new_url
    assert_response :success
  end

  test "should get show" do
    get vendor_types_show_url
    assert_response :success
  end

end
