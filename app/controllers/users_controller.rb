class UsersController < ApplicationController

  before_action :signed_in_user, only: [:index, :edit, :update, :destroy]
  before_action :correct_user,   only: [:edit, :update, :destroy]

  def new
    @user=User.new
  end

  def index
    @users = User.paginate(page: params[:page], :per_page => 10)
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User deleted."
    redirect_to root_url
  end

  def update
    if @user.update_attributes(user_params)
      flash[:success] = "Profile updated"
      redirect_to @user
    else
      render 'edit'
    end

  end

  def create
    @user = User.new(user_params)
    if @user.save
      sign_in @user
      flash[:success] = "Welcome to Twitter #{@user.name}!"
      redirect_to @user
    else
      render 'new'
    end
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation)
    end

    # Before action

    def signed_in_user
      unless signed_in?
        store_location
        flash[:info] = "Please sign in."
        redirect_to signin_url
      end
    end

    def correct_user
      @user = User.find(params[:id])
      unless current_user?(@user)
        flash[:info] = "The page you are asking for does not exists."
        redirect_to root_url
      end
    end
end
