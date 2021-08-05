class GossipController < ApplicationController

  before_action :authenticate_user

    def index
      puts "🍄"*60
      puts session[:user_id]
      puts session[:user_id].class
      puts "🍄"*60

      @selected_city_id = params[:city_id]
      if @selected_city_id != nil
        @all_gossips = City.find(@selected_city_id).gossips
      else
        @all_gossips = Gossip.all
      end
    end
    
      def show
        @num = params[:id]
        @new_comment = Comment.new
        @all_comments = Gossip.find(@num).comments
        @gossip = Gossip.find(@num)
      end
      
      def new
        # Méthode qui crée un potin vide et l'envoie à une view qui affiche le formulaire pour 'le remplir' (new.html.erb)
        # puts Gossip.create(title:'filling_blanks', content:'filling_blanks', user_id:1).errors.messages
        @new_gossip = Gossip.new

        # @new_gossip = Gossip.create(title:'filling_blanks', content:'filling_blanks', user_id:1)
        # @num = @new_gossip.id
        # @new_gossip.errors.messages
        # @num = @new_gossip.id
        # @gossip = Gossip.create(title:params[:titre], content:params[:contenu], user_id:1)

      end
    
      def create
        # Méthode qui créé un potin à partir du contenu du formulaire de new.html.erb, soumis par l'utilisateur
        # pour info, le contenu de ce formulaire sera accessible dans le hash params (ton meilleur pote)
        # Une fois la création faite, on redirige généralement vers la méthode show (pour afficher le potin créé)

        puts "👽"*60
        puts params
        puts "👽"*60

        # @gossip = Gossip.create(title:params[:titre], content:params[:contenu], user_id:User.where(first_name:params[:auteur])[0].id)
        puts "🤠"*50

        puts "🌙"*60
        puts session[:user_id]
        puts session[:user_id].class
        puts session[:user_id].to_i.class
        puts User.find(session[:user_id]).city_id
        # puts current_user.id
        puts "🌙"*60

        

        puts "🌍"*60
        puts Gossip.new
        puts Gossip.new(user_id: session[:user_id].to_i)
        puts "🌻"*60
        @gossip = Gossip.new(user_id: session[:user_id].to_i) # FONCTIONNE !
        # @gossip = Gossip.new(user_id: current_user.id)

        puts @gossip
        puts "🌍"*60
        @gossip.update(params.require(:gossip).permit(:title, :content))
        puts "🌍"*60
        # puts Gossip.create(title: 'bonjour', content:'monde', user_id:24).errors.messages
        puts "🌳"*60

        if @gossip.save # essaie de sauvegarder en base @gossip
          
            # si ça marche, il redirige vers la page d'index du site
            puts "🤠"*50
            # puts @gossip.content
            puts "🤠"*50

            # @all_gossips = Gossip.all

            # render 'index'
            # redirect_to gossip_path(@gossip.id)
            redirect_to gossip_index_path


        else
            # sinon, il render la view new (qui est celle sur laquelle on est déjà)
            # faire en sorte que le message d'erreur s'affiche dans la view "gossip/new"
            puts "🔥"*60
            @new_gossip = Gossip.new
            render new_gossip_path
            # puts "👾"*50
            # puts @gossip.errors
            # puts "👾"*50

        end

      end
    
      def edit

        @num = params[:id]
        @gossip = Gossip.find(@num)

        if User.find(session[:user_id]).id != @gossip.user_id
          # flash.now[:danger] = "T'es ouf ou quoi??"
          redirect_to gossip_path, flash: { error: "T OUF GROS OU KOI" }

          # late: "products/show"

          # render gossip_path(@num)
        end

      end

      def update
        @num = params[:id]
        @gossip = Gossip.find(@num)
        if @gossip.update(post_params)
          redirect_to gossip_path(@num)
          # redirect_to gossip_index_path
          # afficher le message de succès
        else
          render :edit
          # modifier la view edit pour afficher le message d'erreur
        end
      end
    
      def destroy
        # Méthode qui récupère le potin concerné et le détruit en base
        # Une fois la suppression faite, on redirige généralement vers la méthode index (pour afficher la liste à jour)
        @gossip = Gossip.find(params[:id])
        @gossip.destroy
        redirect_to gossip_index_path
      end

      private

      def post_params
        post_params = params.require(:gossip).permit(:title, :content)
      end

      def authenticate_user
        if session[:user_id] == nil
          redirect_to new_session_path
        end 
    end
end 
