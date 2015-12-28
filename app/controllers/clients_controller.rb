class ClientsController < ApplicationController

  before_action :logged_in_user, only: [:show, :update]

  def show
  end

  def new
    @client = Client.new
  end

  def create
    @client = Client.new(client_params)
    if @client.save
      flash['success'] = "Cliente criado com sucesso."
      log_in @client
      redirect_to rool_url
    else
      render 'sessions/new'
    end
  end

  def update
    if current_user.update(client_params)
      flash['success'] = 'Dados Atualizados com Sucesso'
      redirect_to current_user
    else
      render 'show'
    end
  end

  private
    def client_params
      params.require(:client).permit(:first_name, :last_name, :email, :password,
                                      :password_confirmation, :cpf, :phone)
    end

end
