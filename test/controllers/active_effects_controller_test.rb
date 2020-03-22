require 'test_helper'

class ActiveEffectsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @active_effect = active_effects(:one)
  end

  test "should get index" do
    get active_effects_url
    assert_response :success
  end

  test "should get new" do
    get new_active_effect_url
    assert_response :success
  end

  test "should create active_effect" do
    assert_difference('ActiveEffect.count') do
      post active_effects_url, params: { active_effect: { name: @active_effect.name } }
    end

    assert_redirected_to active_effect_url(ActiveEffect.last)
  end

  test "should show active_effect" do
    get active_effect_url(@active_effect)
    assert_response :success
  end

  test "should get edit" do
    get edit_active_effect_url(@active_effect)
    assert_response :success
  end

  test "should update active_effect" do
    patch active_effect_url(@active_effect), params: { active_effect: { name: @active_effect.name } }
    assert_redirected_to active_effect_url(@active_effect)
  end

  test "should destroy active_effect" do
    assert_difference('ActiveEffect.count', -1) do
      delete active_effect_url(@active_effect)
    end

    assert_redirected_to active_effects_url
  end
end
