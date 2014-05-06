class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      sign_in user
      respond_to do |format|
        format.html {
          redirect_to root_url
        }
        format.js {
          render :js => "window.location = '/'"
        }
      end
    else
      respond_to do |format|
        format.html {
          flash.now[:danger] = 'Invalid email/password combination'
          render 'new'
        }
        format.js {
          flash.now[:danger] = 'Invalid email/password combination'
        }
      end
    end
  end



  def destroy
    sign_out
    redirect_to root_url
  end

end
