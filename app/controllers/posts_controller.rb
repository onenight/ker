class PostsController < ApplicationController
  load_and_authorize_resource
  
  before_filter :find_board
  before_filter :authenticate_user!, :except => [ :show, :index ]
  
  # GET /posts
  # GET /posts.json
  def index
    redirect_to board_path(@board)
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
    @post = @board.posts.find(params[:id])
    @latest_posts = Post.order("created_at DESC").limit(6)
    @latest_comments = Comment.order("created_at DESC").limit(6)
    
    @comment = Comment.new
    
    @comments = @post.comments
  end

  # GET /posts/new
  # GET /posts/new.json
  def new
    @post = @board.posts.build
  end

  # GET /posts/1/edit
  def edit
    @post = current_user.posts.find(params[:id])
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = @board.posts.build(params[:post])
    @post.user_id = current_user.id

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
    @post = current_user.posts.find(params[:id])

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
    @post = current_user.posts.find(params[:id])
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
