require "application_system_test_case"

class GuestsTest < ApplicationSystemTestCase
  setup do
    @guest = guests(:one)
  end

  test "visiting the index" do
    visit guests_url
    assert_selector "h1", text: "Guests"
  end

  test "creating a Guest" do
    visit guests_url
    click_on "New Guest"

    fill_in "Address", with: @guest.address
    fill_in "Address Number", with: @guest.address_number
    fill_in "Cep", with: @guest.cep
    fill_in "Cities", with: @guest.cities_id
    fill_in "Email", with: @guest.email
    fill_in "Geolocation", with: @guest.geolocation
    fill_in "Name", with: @guest.name
    fill_in "Phone Number", with: @guest.phone_number
    click_on "Create Guest"

    assert_text "Guest was successfully created"
    click_on "Back"
  end

  test "updating a Guest" do
    visit guests_url
    click_on "Edit", match: :first

    fill_in "Address", with: @guest.address
    fill_in "Address Number", with: @guest.address_number
    fill_in "Cep", with: @guest.cep
    fill_in "Cities", with: @guest.cities_id
    fill_in "Email", with: @guest.email
    fill_in "Geolocation", with: @guest.geolocation
    fill_in "Name", with: @guest.name
    fill_in "Phone Number", with: @guest.phone_number
    click_on "Update Guest"

    assert_text "Guest was successfully updated"
    click_on "Back"
  end

  test "destroying a Guest" do
    visit guests_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Guest was successfully destroyed"
  end
end
