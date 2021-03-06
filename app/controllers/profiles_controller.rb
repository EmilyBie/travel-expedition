class ProfilesController < ApplicationController
  def edit
    @user = User.find(params[:id])
  end
  def update
    user = User.find(params[:id])
    user.name = params[:name];
    user.email = params[:email]
    user.country = params[:country]
    user.image_url = params[:image_url]
    if user.save
      redirect_to '/profile'
    else 
      redirect_to "/profile/edit?id=#{params[:id]}"
    end
  end
  # about page
  def about
    session[:contact] = nil
    session[:about] = "about"
    if loggedin? == false
      session[:index] = nil
    end
  end
  # contact page
  def contact
    session[:about] = nil
    session[:contact] = "contact"
    if loggedin? == false
      session[:index] = nil
    end
  end
end