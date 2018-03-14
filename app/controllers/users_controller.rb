class UsersController < ApplicationController
  before_action :authenticate_user!


  def profile
    @user = current_user
    @tweets = Tweet.where(user_id: current_user.following.push(current_user))
    @tweet = Tweet.new
  end

  def all
    @users = User.all
  end

  def show
    @user = User.find(params['id'])
    @tweets = @user.tweets
    render 'profile'
  end

  def follow
    puts "[DBG] params id is #{params['id']}"
    unless current_user.following.include?(params['id'])
      current_user.following << params['id']
      current_user.save
    end
      redirect_to user_path(params['id'])

    def unfollow
      current_user.following.delete(params['id'])
      current_user.save!
      redirect_to user_path(params['id'])

    end



  end





end
