require "test_helper"

class NyankosControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get nyankos_new_url
    assert_response :success
  end

  test "should get index" do
    get nyankos_index_url
    assert_response :success
  end

  test "should get show" do
    get nyankos_show_url
    assert_response :success
  end

  test "should get edit" do
    get nyankos_edit_url
    assert_response :success
  end
end
