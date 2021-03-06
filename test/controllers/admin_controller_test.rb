require 'test_helper'

class AdminControllerTest < ActionController::TestCase
  test "should get login" do
    get :login
    assert_response :success
  end

  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get books" do
    get :books
    assert_response :success
  end

  test "should get members" do
    get :members
    assert_response :success
  end

  test "should get loan" do
    get :loan
    assert_response :success
  end

end
