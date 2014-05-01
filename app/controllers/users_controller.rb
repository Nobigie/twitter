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
    @microposts = @user.microposts.paginate(page: params[:page])
    if signed_in?
      @micropost = current_user.microposts.build
      @feed_items = current_user.feed.paginate(page: params[:page])
    end
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

  def following?(other_user) #Est-ce que je suis en train de follower un autre user ?
    relationships.find_by(followed_id: other_user.id) #renvoie le couple follower_id - followed_id, follower ID étant la clé primaire (ça cherche pour une clé primaire donnée?) et followed_id la clé étrangère.
  end

  def follow!(other_user)
    relationships.create!(followed_id: other_user.id)
  end

  def unfollow(other_user)
    relationships.find_by(followed_id: other_user.id).destroy
  end




  private

    def user_params
      params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation)
    end

    # Before action

    def correct_user
      @user = User.find(params[:id])
      unless current_user?(@user)
        flash[:info] = "The page you are asking for does not exists."
        redirect_to root_url
      end
    end
end
