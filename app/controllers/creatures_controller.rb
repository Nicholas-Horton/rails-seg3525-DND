class CreaturesController < ApplicationController
  before_action :set_creature, only: [:show, :edit, :update, :destroy]

  def index
    @creatures = Creature.all
  end

  def show
  end

  def new
    @creature = Creature.new
  end

  def edit
  end

  def create
    @creature = Creature.new(creature_params)
    if @creature.save
      redirect_to @creature, notice: 'Creature was successfully created.'
    else
      render :new
    end
  end

  def update
    if @creature.update(creature_params)
      redirect_to @creature, notice: 'Creature was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @creature.destroy
    redirect_to creatures_url, notice: 'Creature was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_creature
      @creature = Creature.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def creature_params
      params.require(:creature).permit(:name, :armor_class, :hitpoints, :speed, :strength, :dexterity, :constitution, :intelligence, :wisdom, :charisma, :saving_throw, :damage_immunities, :condition_immunities, :senses, :languages, :challenge_rating, :experience, :description)
    end
end
