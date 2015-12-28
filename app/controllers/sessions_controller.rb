class SessionsController < ApplicationController
  def new
    @client = Client.new
  end

  def create
    client = Client.find_by(email: params[:session][:email].downcase)
    if client && client.authenticate(params[:session][:password])
        #Log the user in...
        log_in client
        redirect_back_or client
    else
      #create an error message
      @client = Client.new
      flash.now[:danger] = 'Email/Senha invalidos'
      render 'new'
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end
end
