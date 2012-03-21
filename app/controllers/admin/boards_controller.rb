class Admin::BoardsController < ApplicationController
  layout 'admin'
  load_and_authorize_resource
  before_filter :require_is_admin
  
  # GET /boards
  # GET /boards.json
  def index
    @boards = Board.all

    respond_to do |format|
      format.html # index.html.erb
    end
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
  
  # GET /boards/new
  # GET /boards/new.json
  def new
    @board = Board.new
  end

  # GET /boards/1/edit
  def edit
    @board = Board.find(params[:id])
  end

  # POST /boards
  # POST /boards.json
  def create
    @board = Board.new(params[:board])

    respond_to do |format|
      if @board.save
        format.html { redirect_to admin_board_path(@board), 
          :notice => 'Board was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # PUT /boards/1
  # PUT /boards/1.json
  def update
    @board = Board.find(params[:id])

    respond_to do |format|
      if @board.update_attributes(params[:board])
        format.html { redirect_to admin_board_path(@board), 
          :notice => 'Board was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /boards/1
  # DELETE /boards/1.json
  def destroy
    @board = Board.find(params[:id])
    @board.destroy

    respond_to do |format|
      format.html { redirect_to admin_boards_url }
      format.json { head :ok }
    end
  end
end
