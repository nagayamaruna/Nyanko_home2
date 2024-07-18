require "test_helper"

class NyankogramsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get nyankograms_new_url
    assert_response :success
  end

  test "should get index" do
    get nyankograms_index_url
    assert_response :success
  end

  test "should get show" do
    get nyankograms_show_url
    assert_response :success
  end
end
