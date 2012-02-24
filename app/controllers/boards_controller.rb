class BoardsController < ApplicationController
  
  # GET /boards
  # GET /boards.json
  def index
    @boards = Board.all
        
    @test1 = Board.find(1)
    @test2 = Board.find(2)
    @test3 = Board.find(3)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @boards }
    end
  end

  # GET /boards/1
  # GET /boards/1.json
  def show
    @board = Board.find(params[:id])
    @posts = @board.posts.order("created_at DESC").page(params[:page]).per(5)

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @board }
    end
  end
end
