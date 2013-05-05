require 'test_helper'

class AproposControllerTest < ActionController::TestCase
  test "should get how_to_use" do
    get :how_to_use
    assert_response :success
  end

  test "should get about" do
    get :about
    assert_response :success
  end

end
