require 'test_helper'

class ServicesControllerTest < ActionDispatch::IntegrationTest
  test "should get _form" do
    get services__form_url
    assert_response :success
  end

  test "should get edit" do
    get services_edit_url
    assert_response :success
  end

  test "should get index" do
    get services_index_url
    assert_response :success
  end

  test "should get new" do
    get services_new_url
    assert_response :success
  end

  test "should get show" do
    get services_show_url
    assert_response :success
  end

end
