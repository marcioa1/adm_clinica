class UserSessionsController < ApplicationController

   layout "login"
   before_filter :require_user, :only => :destroy

    def new
      @user_session = UserSession.new
    end
    
    def create
      # reset_session
      @user_session = UserSession.new(params[:user_session])
      if @user_session.save
        user         = User.find_by_login(@user_session.login)
        current_user = user
        expire_fragment "cabecalho_#{current_user.id}"
        debugger
        session[:clinica_id] = current_user.clinica.id
        @clinica_atual = Clinica.find(session[:clinica_id])
        Debito.verifica_debitos_de_ortodontia(session[:clinica_id]) 
        redirect_to pesquisa_pacientes_path
      else
        flash[:error] = " Usuário não encontrado. Por favor verifique usuário, senha e dias e horários permitidos."
        redirect_to new_user_sessions_path 
      end
    end

    def destroy
      current_user_session.destroy
      flash[:notice] = "Obrigado pela visita !"
      redirect_to root_path
    end
    
    
end
#MAAM2849

# senha maumau JoaoPE15