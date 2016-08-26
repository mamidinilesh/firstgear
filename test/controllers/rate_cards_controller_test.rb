require 'test_helper'

class RateCardsControllerTest < ActionDispatch::IntegrationTest
  test "should get _form" do
    get rate_cards__form_url
    assert_response :success
  end

  test "should get edit" do
    get rate_cards_edit_url
    assert_response :success
  end

  test "should get index" do
    get rate_cards_index_url
    assert_response :success
  end

  test "should get new" do
    get rate_cards_new_url
    assert_response :success
  end

  test "should get show" do
    get rate_cards_show_url
    assert_response :success
  end

end
