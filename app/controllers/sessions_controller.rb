class SessionsController < ApplicationController
  def new
  end

  def create

    puts "π"*60
    puts params
    puts "ππΌπΌ"*60

    # cherche s'il existe un utilisateur en base avec lβe-mail
    user = User.find_by(email: params[:email])

    puts "π‘"*60
    puts user
    puts "π‘"*60

    puts "π¦ππ"*60
    puts user.id
    puts "π¦"*60

    puts "π³"*60
    puts params[:password]
    puts "π³π"*60

    puts "π¦"*60
    puts user.authenticate(params[:password])
    puts "π¦π±π"*60


    # on vΓ©rifie si l'utilisateur existe bien ET si on arrive Γ  l'authentifier (mΓ©thode bcrypt) avec le mot de passe 
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      # redirige oΓΉ tu veux, avec un flash ou pas

      redirect_to gossip_index_path

    else
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def destroy
    # @session = session[:user_id]  
    session.delete(:user_id)
    redirect_to new_session_path
  end
end



