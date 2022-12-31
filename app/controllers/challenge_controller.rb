class ChallengeController < ApplicationController
  def index
    @challenges = Challenge.all.order(created_at: :desc)
  end

  def new
    @challenge =Challenge.new
  end

  def create
    @challenge = Challenge.new(challenge_params)
    if @challenge.save
      redirect_to @challenge
    else
      render :new
    end
  end

  def show
    @challenge = Challenge.find(params[:id])
  end

  private
  
  def challenge_params
    params.require(:challenge).permit(:nickname, :timing, :category)
  end
end
