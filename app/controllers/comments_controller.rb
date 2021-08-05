class CommentsController < ApplicationController
  def new
  end

  def create
    # puts "🎃"*60
    # puts params
    # puts "🎃"*60
    @num = params[:gossip_id]
    @new_comment = Comment.new(gossip_id:@num, user_id:1)

    # puts "🤡"*60
    # puts @new_comment.user_id
    # puts "🤡"*60
    
    @new_comment.update(params.require(:comment).permit(:content))

    # puts "🫁"*60
    # puts @new_comment.content
    # puts "🫁"*60

    # @new_comment.save

    redirect_to gossip_path(@num)
  end

  def edit
    @num = params[:id]
    @comment = Comment.find(@num)
  end

  def update
    @num = params[:id]
    Comment.find(@num).update(params.require(:comment).permit(:content))

    redirect_to gossip_path(Comment.find(@num).gossip_id)
  end

  def destroy
    @num = params[:id]
    @gossip_id = Comment.find(@num).gossip_id
    @comment = Comment.find(@num)
    @comment.destroy

    redirect_to gossip_path(@gossip_id)
  end
end
