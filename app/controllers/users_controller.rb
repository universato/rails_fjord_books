# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def destroy
    current_user.destroy
    redirect_to users_path
  end

  def following
    @title = t("dictionary.follow")
    @user  = User.find(params[:id])
    @users = @user.following
    render "show_follow"
  end

  def followers
    @title = t("dictionary.follower")
    @user  = User.find(params[:id])
    @users = @user.followers
    render "show_follow"
  end

  private
    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:book).permit(:email, :icon)
    end
end
