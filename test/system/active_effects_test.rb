require "application_system_test_case"

class ActiveEffectsTest < ApplicationSystemTestCase
  setup do
    @active_effect = active_effects(:one)
  end

  test "visiting the index" do
    visit active_effects_url
    assert_selector "h1", text: "Active Effects"
  end

  test "creating a Active effect" do
    visit active_effects_url
    click_on "New Active Effect"

    fill_in "Name", with: @active_effect.name
    click_on "Create Active effect"

    assert_text "Active effect was successfully created"
    click_on "Back"
  end

  test "updating a Active effect" do
    visit active_effects_url
    click_on "Edit", match: :first

    fill_in "Name", with: @active_effect.name
    click_on "Update Active effect"

    assert_text "Active effect was successfully updated"
    click_on "Back"
  end

  test "destroying a Active effect" do
    visit active_effects_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Active effect was successfully destroyed"
  end
end
