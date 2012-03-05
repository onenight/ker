class BoardsController < ApplicationController
  
  # GET /boards
  # GET /boards.json
  def index
    @boards = Board.all
    render :layout => 'home'
  end

  # GET /boards/1
  # GET /boards/1.json
  def show
    @board = Board.find(params[:id])
    @latest_posts = Post.order("created_at DESC").limit(6)
    @latest_comments = Comment.order("created_at DESC").limit(6)
    @posts = @board.posts.order("created_at DESC").page(params[:page]).per(10)

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @board }
    end
  end
end
