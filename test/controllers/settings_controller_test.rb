require 'test_helper'

class SettingsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @setting = settings(:one)
  end

  test "should get index" do
    get settings_url
    assert_response :success
  end

  test "should get new" do
    get new_setting_url
    assert_response :success
  end

  test "should create setting" do
    assert_difference('Setting.count') do
      post settings_url, params: { setting: { days_for_reserve_cancellation: @setting.days_for_reserve_cancellation, days_for_reserve_refund: @setting.days_for_reserve_refund, days_of_ticket_validity: @setting.days_of_ticket_validity, percentage_of_administration: @setting.percentage_of_administration, percentage_of_franchisee: @setting.percentage_of_franchisee, percentage_of_property: @setting.percentage_of_property } }
    end

    assert_redirected_to setting_url(Setting.last)
  end

  test "should show setting" do
    get setting_url(@setting)
    assert_response :success
  end

  test "should get edit" do
    get edit_setting_url(@setting)
    assert_response :success
  end

  test "should update setting" do
    patch setting_url(@setting), params: { setting: { days_for_reserve_cancellation: @setting.days_for_reserve_cancellation, days_for_reserve_refund: @setting.days_for_reserve_refund, days_of_ticket_validity: @setting.days_of_ticket_validity, percentage_of_administration: @setting.percentage_of_administration, percentage_of_franchisee: @setting.percentage_of_franchisee, percentage_of_property: @setting.percentage_of_property } }
    assert_redirected_to setting_url(@setting)
  end

  test "should destroy setting" do
    assert_difference('Setting.count', -1) do
      delete setting_url(@setting)
    end

    assert_redirected_to settings_url
  end
end
