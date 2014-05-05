class MicropostsController < ApplicationController
  before_action :signed_in_user, only: [:create, :destroy]
  before_action :correct_user,   only: :destroy

  def create
    @micropost = current_user.microposts.build(micropost_params)
    if @micropost.save
      @feed_items = current_user.feed.paginate(page: params[:page])

      respond_to do |format|
        format.html {
          redirect_to root_url
        }
        format.js {} #flash[:success] = "Micropost created!"
      end
    else
      @feed_items = current_user.feed.paginate(page: params[:page])
      respond_to do |format|
        format.html { render 'static_pages/home'}  #{}"/users/#{params[:id]}" #J'aimerai que ça render dans vue actuelle. que ce soit root ou users#show
        format.js
      end

    end
  end

  def destroy
    @micropost.destroy
    redirect_to root_url
  end

  private

    def micropost_params
      params.require(:micropost).permit(:content)
    end

    def correct_user
      @micropost = current_user.microposts.find_by(id: params[:id])
      redirect_to root_url if @micropost.nil?
    end
end
