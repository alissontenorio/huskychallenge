require "application_system_test_case"

class TestandosTest < ApplicationSystemTestCase
  setup do
    @testando = testandos(:one)
  end

  test "visiting the index" do
    visit testandos_url
    assert_selector "h1", text: "Testandos"
  end

  test "creating a Testando" do
    visit testandos_url
    click_on "New Testando"

    click_on "Create Testando"

    assert_text "Testando was successfully created"
    click_on "Back"
  end

  test "updating a Testando" do
    visit testandos_url
    click_on "Edit", match: :first

    click_on "Update Testando"

    assert_text "Testando was successfully updated"
    click_on "Back"
  end

  test "destroying a Testando" do
    visit testandos_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Testando was successfully destroyed"
  end
end
