class PostsController < ApplicationController
  before_action :set_post, only: %i[ show update destroy ]

  # GET /posts
  def index
    begin 
      @posts = Post.all
      render "posts/index"
    rescue => e
      render json: { error: e.message }, status: 403
    end
  end

  # GET /posts/1
  def show
    begin
      render "posts/show"
    rescue => e
      render json: { error: e.message }, status: 403
    end
  end

  # POST /posts
  def create
    begin
      @post = Post.new(post_params)

      return render json: {error: @post.errors}, status: 403 unless @post.save
      render "posts/show", status: 201
    rescue => e
      render json: { error: e.message }, status: 403
    end
  end

  # PATCH/PUT /posts/1
  def update
    begin
      @post.assign_attributes(post_params)

      raise @post.errors.to_json unless @post.save
      render "posts/show", status: 201
    rescue => e
      render json: { error: e}, status: 403
    end
  end

  # DELETE /posts/1
  def destroy
    begin
      raise @post.errors.to_json unless @post.destroy
      render "posts/show", status: 200
    rescue => e
      render json: { error: e}, status: 403
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def post_params
      params.require(:post).permit(:name, :content)
    end
end
