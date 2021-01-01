class RelationshipsController < ApplicationController
  before_action :set_user,except: [:show]


  # フォロー機能　follow_id,unfollow_idを使ってもいいかも
  def create
    following = current_user.follow(@user)
    if following.save
      flash[:notice] = 'ユーザーをフォローしました'
      redirect_back(fallback_location: root_path)
    else
      flash.now[:notice] = 'ユーザーのフォローに失敗しました'
      redirect_back(fallback_location: root_path)
    end
  end

  def destroy
    following = current_user.unfollow(@user)
    if following.destroy
      flash[:notice] = 'ユーザーのフォローを解除しました'
      redirect_back(fallback_location: root_path)
    else
      flash.now[:notice] = 'ユーザーのフォロー解除に失敗しました'
      redirect_back(fallback_location: root_path)
    end
  end

  def show
    @user = User.find(params[:id])
    @users = @user.followings.all
  end

  def index
    @user = User.find(params[:id])
    @users = @user.followers.all
  end

  private
  def set_user
    # @user = User.find(params[:relationship][:follow_id])
    @user = User.find_by(id: params[:follow_id])
  end

end