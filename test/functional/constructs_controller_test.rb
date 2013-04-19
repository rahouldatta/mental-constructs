require 'test_helper'

class ConstructsControllerTest < ActionController::TestCase
  setup do
    @construct = constructs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:constructs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create construct" do
    assert_difference('Construct.count') do
      post :create, construct: { affinity_level: @construct.affinity_level, construct: @construct.construct, dossier_id: @construct.dossier_id, foot_notes: @construct.foot_notes, share: @construct.share, thinker_id: @construct.thinker_id, title: @construct.title }
    end

    assert_redirected_to construct_path(assigns(:construct))
  end

  test "should show construct" do
    get :show, id: @construct
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @construct
    assert_response :success
  end

  test "should update construct" do
    put :update, id: @construct, construct: { affinity_level: @construct.affinity_level, construct: @construct.construct, dossier_id: @construct.dossier_id, foot_notes: @construct.foot_notes, share: @construct.share, thinker_id: @construct.thinker_id, title: @construct.title }
    assert_redirected_to construct_path(assigns(:construct))
  end

  test "should destroy construct" do
    assert_difference('Construct.count', -1) do
      delete :destroy, id: @construct
    end

    assert_redirected_to constructs_path
  end
end
