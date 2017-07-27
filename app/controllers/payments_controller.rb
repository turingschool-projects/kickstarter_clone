class PaymentsController < ApplicationController

  def new
    @reward = Reward.find(params[:reward_id])
  end

  def create
    if current_user
      @reward = Reward.find(params[:reward_id])
      transaction = current_user.project_backers.new(
                                          reward: @reward,
                                          project: @reward.project,
                                          pledge_amount: @reward.pledge_amount
                                          )
      if transaction.save
        flash[:success] = "thanks!"
        redirect_to confirmation_path(reward_id: @reward.id)
      else
        flash[:error] = "unsuccessful transaction. :( "
      end
    else
      flash[:error] = "Need to login to back a project"
      redirect_to login_path
    end
  end

end
