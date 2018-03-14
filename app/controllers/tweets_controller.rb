class tweetsController < ApplicationController

  def create
    @tweet = Tweet.new()
  if @tweet.save
    dedirect_to users_profile_path
  else
    @user = current_user

  end

  end

  private

  def tweets_params
    params.require(:tweet).permit(:message)

  end





end
