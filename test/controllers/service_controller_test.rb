require 'test_helper'

class ServiceControllerTest < ActionDispatch::IntegrationTest
  test "should get region" do
    get service_region_url
    assert_response :success
  end

  test "should get name:string" do
    get service_name:string_url
    assert_response :success
  end

  test "should get category:references" do
    get service_category:references_url
    assert_response :success
  end

  test "should get default_commission:integer" do
    get service_default_commission:integer_url
    assert_response :success
  end

  test "should get active:boolean" do
    get service_active:boolean_url
    assert_response :success
  end

end
