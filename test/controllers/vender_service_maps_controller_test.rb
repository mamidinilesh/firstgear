require 'test_helper'

class VenderServiceMapsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @vender_service_map = vender_service_maps(:one)
  end

  test "should get index" do
    get vender_service_maps_url
    assert_response :success
  end

  test "should get new" do
    get new_vender_service_map_url
    assert_response :success
  end

  test "should create vender_service_map" do
    assert_difference('VenderServiceMap.count') do
      post vender_service_maps_url, params: { vender_service_map: { active: @vender_service_map.active, commission: @vender_service_map.commission, is_inclusive: @vender_service_map.is_inclusive, service_id: @vender_service_map.service_id, vehicle_id: @vender_service_map.vehicle_id, vendor_id: @vender_service_map.vendor_id } }
    end

    assert_redirected_to vender_service_map_url(VenderServiceMap.last)
  end

  test "should show vender_service_map" do
    get vender_service_map_url(@vender_service_map)
    assert_response :success
  end

  test "should get edit" do
    get edit_vender_service_map_url(@vender_service_map)
    assert_response :success
  end

  test "should update vender_service_map" do
    patch vender_service_map_url(@vender_service_map), params: { vender_service_map: { active: @vender_service_map.active, commission: @vender_service_map.commission, is_inclusive: @vender_service_map.is_inclusive, service_id: @vender_service_map.service_id, vehicle_id: @vender_service_map.vehicle_id, vendor_id: @vender_service_map.vendor_id } }
    assert_redirected_to vender_service_map_url(@vender_service_map)
  end

  test "should destroy vender_service_map" do
    assert_difference('VenderServiceMap.count', -1) do
      delete vender_service_map_url(@vender_service_map)
    end

    assert_redirected_to vender_service_maps_url
  end
end
