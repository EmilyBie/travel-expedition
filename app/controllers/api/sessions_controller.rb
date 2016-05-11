class SessionsController < ApplicationController

  def index
  end

  def signup
  end

  def login
  end

  def join
    if User.find_by(name: params[:name]) || !Country.find_by(name: params[:country])
      redirect_to '/signup'
    else
      user = User.new
      user.name = params[:name].downcase
      user.email =params[:email]
      user.password = params[:password]
      user.save
      session[:id] = user.id
      redirect_to "/profile"
    end
  end

  def signedin
    user = User.find_by(name: "#{params[:username].downcase}" )
      if user && user.authenticate(params[:password])
        session[:id] = user.id
        redirect_to '/profile'
      else
        redirect_to '/login'
      end
  end


  def logout
    session[:id] = nil
    redirect_to "/"
  end

end