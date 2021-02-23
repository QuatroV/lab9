require 'test_helper'

class IndexControllerTest < ActionDispatch::IntegrationTest
  test "should get input" do
    get index_input_url
    assert_response :success
  end

  test "should get output" do
    get index_output_url, params: {num: 4.0}
    assert_response :success
  end

  test "should get 2 for 4" do
    get index_output_url, params: {num: 4.0}
    assert_response :success
    assert_in_delta 2.0, assigns[:x].last, 0.001, "Program does not work properly when 4.0 is given"
  end

  test "should get error for no input" do
    get index_output_url, params: {num: nil}
    assert_response :success
    assert_equal 'Ошибка!', assigns[:error], "No error for empty input"
  end

  test "should get error for string input" do
    get index_output_url, params: {num: 'test_string'}
    assert_response :success
    assert_equal 'Ошибка!', assigns[:error], "No error for empty input"
  end
end
