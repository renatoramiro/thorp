class PostsController < ApplicationController
  layout 'dashboard'
  # GET /posts
  # GET /posts.json
  def index
    unless params[:page].present?
      page = 1
    end
    page ||= params[:page]
    @posts = current_user.timeline(page)
    @post = current_user.posts.build
    @post.reply_to_id = params[:reply_to_id] if params[:reply_to_id].present?

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @posts }
    end
  end

  # GET /posts/new
  # GET /posts/new.json
  def new
    @post = current_user.posts.build
    @post.reply_to_id = params[:reply_to_id] if params[:reply_to_id].present?

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @post }
    end
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = current_user.posts.build(params[:post])

    respond_to do |format|
      if @post.save
        format.js   { @posts = current_user.timeline(1) }
        format.html { redirect_to posts_url }
        format.json { render json: @post, status: :created, location: @post }
      else
        format.html { render action: "new" }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post = current_user.posts.find(params[:id])
    @post.destroy

    respond_to do |format|
      format.html { redirect_to posts_url }
      format.js   { @posts = current_user.timeline(1) }
      format.json { head :no_content }
    end
  end
end
