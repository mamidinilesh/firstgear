require 'test_helper'

class VendeContrctMapsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @vende_contrct_map = vende_contrct_maps(:one)
  end

  test "should get index" do
    get vende_contrct_maps_url
    assert_response :success
  end

  test "should get new" do
    get new_vende_contrct_map_url
    assert_response :success
  end

  test "should create vende_contrct_map" do
    assert_difference('VendeContrctMap.count') do
      post vende_contrct_maps_url, params: { vende_contrct_map: { active: @vende_contrct_map.active, category_id: @vende_contrct_map.category_id, commission: @vende_contrct_map.commission, is_inclusive: @vende_contrct_map.is_inclusive, vendor_contract_id: @vende_contrct_map.vendor_contract_id } }
    end

    assert_redirected_to vende_contrct_map_url(VendeContrctMap.last)
  end

  test "should show vende_contrct_map" do
    get vende_contrct_map_url(@vende_contrct_map)
    assert_response :success
  end

  test "should get edit" do
    get edit_vende_contrct_map_url(@vende_contrct_map)
    assert_response :success
  end

  test "should update vende_contrct_map" do
    patch vende_contrct_map_url(@vende_contrct_map), params: { vende_contrct_map: { active: @vende_contrct_map.active, category_id: @vende_contrct_map.category_id, commission: @vende_contrct_map.commission, is_inclusive: @vende_contrct_map.is_inclusive, vendor_contract_id: @vende_contrct_map.vendor_contract_id } }
    assert_redirected_to vende_contrct_map_url(@vende_contrct_map)
  end

  test "should destroy vende_contrct_map" do
    assert_difference('VendeContrctMap.count', -1) do
      delete vende_contrct_map_url(@vende_contrct_map)
    end

    assert_redirected_to vende_contrct_maps_url
  end
end
