class CampaignsController < ApplicationController
  before_action :set_campaign, only: [:show, :edit, :update, :destroy, :edit_campaign, :show_campaign]

  def index
    @campaigns = Campaign.all
  end

  def show
  end

  def show_campaign
  end

  # GET /campaigns/new
  def new
    @campaign = Campaign.new
  end

  def edit
  end

  def create
    @campaign = Campaign.new(campaign_params)
    if @campaign.save
      redirect_to @campaign, notice: 'Campaign was successfully created.'
    else
      render :new
    end
  end

  def user_create
    @campaign = Campaign.new(campaign_params)
    @campaign.user_id = current_user.id

    if @campaign.save
      redirect_to edit_campaign_campaign_path(@campaign), notice: 'Campaign was successfully created.'
    else
      render :new
    end
  end

  def new_campaign
    @campaign = Campaign.new
  end

  def update
    if @campaign.update(campaign_params)
      redirect_to show_campaign_campaign_path(@campaign), notice: 'Campaign was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @campaign.destroy
    redirect_to campaigns_url, notice: 'Campaign was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_campaign
      @campaign = Campaign.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def campaign_params
      params.require(:campaign).permit(:user_id, :name)
    end
end
