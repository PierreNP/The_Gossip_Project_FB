class SessionsController < ApplicationController
  def new
  end

  def create

    puts "🐍"*60
    puts params
    puts "🐍🚼🚼"*60

    # cherche s'il existe un utilisateur en base avec l’e-mail
    user = User.find_by(email: params[:email])

    puts "🐡"*60
    puts user
    puts "🐡"*60

    puts "🦀🆘🆘"*60
    puts user.id
    puts "🦀"*60

    puts "🐳"*60
    puts params[:password]
    puts "🐳🔞"*60

    puts "🦜"*60
    puts user.authenticate(params[:password])
    puts "🦜😱🔞"*60


    # on vérifie si l'utilisateur existe bien ET si on arrive à l'authentifier (méthode bcrypt) avec le mot de passe 
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      # redirige où tu veux, avec un flash ou pas

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



