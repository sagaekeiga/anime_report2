require 'test_helper'

class PagesControllerTest < ActionController::TestCase
  test "should get bot" do
    get :bot
    assert_response :success
  end

  test "should get story" do
    get :story
    assert_response :success
  end

  test "should get channel" do
    get :channel
    assert_response :success
  end

end
