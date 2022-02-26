require 'test_helper'

class Public::AnswerControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get public_answer_index_url
    assert_response :success
  end

  test "should get edit" do
    get public_answer_edit_url
    assert_response :success
  end

  test "should get show" do
    get public_answer_show_url
    assert_response :success
  end

  test "should get new" do
    get public_answer_new_url
    assert_response :success
  end

end
