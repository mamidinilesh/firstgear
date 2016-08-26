require 'test_helper'

class VendorContractsControllerTest < ActionDispatch::IntegrationTest
  test "should get _form" do
    get vendor_contracts__form_url
    assert_response :success
  end

  test "should get edit" do
    get vendor_contracts_edit_url
    assert_response :success
  end

  test "should get index" do
    get vendor_contracts_index_url
    assert_response :success
  end

  test "should get new" do
    get vendor_contracts_new_url
    assert_response :success
  end

  test "should get show" do
    get vendor_contracts_show_url
    assert_response :success
  end

end
