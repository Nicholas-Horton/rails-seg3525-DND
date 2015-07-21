class SpellsController < ApplicationController
  before_action :set_spell, only: [:show, :edit, :update, :destroy]

  def index
    @spells = Spell.all
  end

  def show
  end

  def new
    @spell = Spell.new
  end

  def edit
  end

  def create
    @spell = Spell.new(spell_params)
    if @spell.save
      redirect_to @spell, notice: 'Spell was successfully created.'
    else
      render :new
    end
  end

  def update
    if @spell.update(spell_params)
      redirect_to @spell, notice: 'Spell was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @spell.destroy
    redirect_to spells_url, notice: 'Spell was successfully destroyed.'
  end

  def get_spell
    s = Spell.find(params[:spell_id])
    spell_info = {
      spellName: s.name,
      spellCastingTime: s.casting_time,
      spellRange: s.range,
      spellComponents: s.components,
      spellDuration: s.duration,
      spellMaterialComponents: s.material_components,
      spellDescription: s.description,
      spellClass: s.spell_class,
      spellSchool: s.school,
      spellLevel: s.level,
      concentration: s.concentration,
      ritual: s.ritual
    }.to_json
    puts spell_info
    render text: spell_info
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_spell
      @spell = Spell.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def spell_params
      params.require(:spell).permit(:name, :description, :spell_class, :level, :school, :ritual, :casting_time, :components, :concentration, :source)
    end
end
