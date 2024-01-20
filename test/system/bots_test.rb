require "application_system_test_case"

class BotsTest < ApplicationSystemTestCase
  setup do
    @bot = bots(:one)
  end

  test "visiting the index" do
    visit bots_url
    assert_selector "h1", text: "Bots"
  end

  test "should create bot" do
    visit bots_url
    click_on "New bot"

    fill_in "Attack", with: @bot.attack
    fill_in "Catchphrase", with: @bot.catchphrase
    fill_in "Catchphrase lose", with: @bot.catchphrase_lose
    fill_in "Defense", with: @bot.defense
    fill_in "Description", with: @bot.description
    fill_in "Element", with: @bot.element
    fill_in "Move name", with: @bot.move_name
    fill_in "Name", with: @bot.name
    fill_in "Speed", with: @bot.speed
    click_on "Create Bot"

    assert_text "Bot was successfully created"
    click_on "Back"
  end

  test "should update Bot" do
    visit bot_url(@bot)
    click_on "Edit this bot", match: :first

    fill_in "Attack", with: @bot.attack
    fill_in "Catchphrase", with: @bot.catchphrase
    fill_in "Catchphrase lose", with: @bot.catchphrase_lose
    fill_in "Defense", with: @bot.defense
    fill_in "Description", with: @bot.description
    fill_in "Element", with: @bot.element
    fill_in "Move name", with: @bot.move_name
    fill_in "Name", with: @bot.name
    fill_in "Speed", with: @bot.speed
    click_on "Update Bot"

    assert_text "Bot was successfully updated"
    click_on "Back"
  end

  test "should destroy Bot" do
    visit bot_url(@bot)
    click_on "Destroy this bot", match: :first

    assert_text "Bot was successfully destroyed"
  end
end
