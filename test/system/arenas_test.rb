require "application_system_test_case"

class ArenasTest < ApplicationSystemTestCase
  setup do
    @arena = arenas(:one)
  end

  test "visiting the index" do
    visit arenas_url
    assert_selector "h1", text: "Arenas"
  end

  test "should create arena" do
    visit arenas_url
    click_on "New arena"

    check "Concluded" if @arena.concluded
    fill_in "Name", with: @arena.name
    click_on "Create Arena"

    assert_text "Arena was successfully created"
    click_on "Back"
  end

  test "should update Arena" do
    visit arena_url(@arena)
    click_on "Edit this arena", match: :first

    check "Concluded" if @arena.concluded
    fill_in "Name", with: @arena.name
    click_on "Update Arena"

    assert_text "Arena was successfully updated"
    click_on "Back"
  end

  test "should destroy Arena" do
    visit arena_url(@arena)
    click_on "Destroy this arena", match: :first

    assert_text "Arena was successfully destroyed"
  end
end
