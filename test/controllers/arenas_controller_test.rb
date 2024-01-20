require "test_helper"

class ArenasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @arena = arenas(:one)
  end

  test "should get index" do
    get arenas_url
    assert_response :success
  end

  test "should get new" do
    get new_arena_url
    assert_response :success
  end

  test "should create arena" do
    assert_difference("Arena.count") do
      post arenas_url, params: { arena: { concluded: @arena.concluded, name: @arena.name } }
    end

    assert_redirected_to arena_url(Arena.last)
  end

  test "should show arena" do
    get arena_url(@arena)
    assert_response :success
  end

  test "should get edit" do
    get edit_arena_url(@arena)
    assert_response :success
  end

  test "should update arena" do
    patch arena_url(@arena), params: { arena: { concluded: @arena.concluded, name: @arena.name } }
    assert_redirected_to arena_url(@arena)
  end

  test "should destroy arena" do
    assert_difference("Arena.count", -1) do
      delete arena_url(@arena)
    end

    assert_redirected_to arenas_url
  end
end
