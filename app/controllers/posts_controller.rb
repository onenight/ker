class PostsController < ApplicationController
  before_filter :find_board
  
  # GET /posts
  # GET /posts.json
  def index
    redirect_to boards_path
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
    @post = @board.posts.find(params[:id])
  end

  # GET /posts/new
  # GET /posts/new.json
  def new
    @post = @board.posts.build
  end

  # GET /posts/1/edit
  def edit
    @post = @board.posts.find(params[:id])
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = @board.posts.build(params[:post])

    respond_to do |format|
      if @post.save
        format.html { redirect_to board_post_path(@board, @post), 
          :notice => 'Post was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # PUT /posts/1
  # PUT /posts/1.json
  def update
    @post = @board.posts.find(params[:id])

    respond_to do |format|
      if @post.update_attributes(params[:post])
        format.html { redirect_to board_post_path(@board, @post), 
          :notice => 'Post was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post = @board.posts.find(params[:id])
    @post.destroy

    respond_to do |format|
      format.html { redirect_to board_posts_path(@board) }
    end
  end
  
  protected
  def find_board
    @board = Board.find(params[:board_id])
  end
end
