require 'test_helper'

class CreaturesControllerTest < ActionController::TestCase
  setup do
    @creature = creatures(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:creatures)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create creature" do
    assert_difference('Creature.count') do
      post :create, creature: { armor_class: @creature.armor_class, challenge_rating: @creature.challenge_rating, charisma: @creature.charisma, condition_immunities: @creature.condition_immunities, constitution: @creature.constitution, damage_immunities: @creature.damage_immunities, description: @creature.description, dexterity: @creature.dexterity, experience: @creature.experience, hitpoints: @creature.hitpoints, intelligence: @creature.intelligence, languages: @creature.languages, name: @creature.name, saving_throw: @creature.saving_throw, senses: @creature.senses, speed: @creature.speed, strength: @creature.strength, wisdom: @creature.wisdom }
    end

    assert_redirected_to creature_path(assigns(:creature))
  end

  test "should show creature" do
    get :show, id: @creature
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @creature
    assert_response :success
  end

  test "should update creature" do
    patch :update, id: @creature, creature: { armor_class: @creature.armor_class, challenge_rating: @creature.challenge_rating, charisma: @creature.charisma, condition_immunities: @creature.condition_immunities, constitution: @creature.constitution, damage_immunities: @creature.damage_immunities, description: @creature.description, dexterity: @creature.dexterity, experience: @creature.experience, hitpoints: @creature.hitpoints, intelligence: @creature.intelligence, languages: @creature.languages, name: @creature.name, saving_throw: @creature.saving_throw, senses: @creature.senses, speed: @creature.speed, strength: @creature.strength, wisdom: @creature.wisdom }
    assert_redirected_to creature_path(assigns(:creature))
  end

  test "should destroy creature" do
    assert_difference('Creature.count', -1) do
      delete :destroy, id: @creature
    end

    assert_redirected_to creatures_path
  end
end
