require "application_system_test_case"

class SettingsTest < ApplicationSystemTestCase
  setup do
    @setting = settings(:one)
  end

  test "visiting the index" do
    visit settings_url
    assert_selector "h1", text: "Settings"
  end

  test "creating a Setting" do
    visit settings_url
    click_on "New Setting"

    fill_in "Days For Reserve Cancellation", with: @setting.days_for_reserve_cancellation
    fill_in "Days For Reserve Refund", with: @setting.days_for_reserve_refund
    fill_in "Days Of Ticket Validity", with: @setting.days_of_ticket_validity
    fill_in "Percentage Of Administration", with: @setting.percentage_of_administration
    fill_in "Percentage Of Franchisee", with: @setting.percentage_of_franchisee
    fill_in "Percentage Of Property", with: @setting.percentage_of_property
    click_on "Create Setting"

    assert_text "Setting was successfully created"
    click_on "Back"
  end

  test "updating a Setting" do
    visit settings_url
    click_on "Edit", match: :first

    fill_in "Days For Reserve Cancellation", with: @setting.days_for_reserve_cancellation
    fill_in "Days For Reserve Refund", with: @setting.days_for_reserve_refund
    fill_in "Days Of Ticket Validity", with: @setting.days_of_ticket_validity
    fill_in "Percentage Of Administration", with: @setting.percentage_of_administration
    fill_in "Percentage Of Franchisee", with: @setting.percentage_of_franchisee
    fill_in "Percentage Of Property", with: @setting.percentage_of_property
    click_on "Update Setting"

    assert_text "Setting was successfully updated"
    click_on "Back"
  end

  test "destroying a Setting" do
    visit settings_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Setting was successfully destroyed"
  end
end
