class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  def index
    @posts = Post.order('created_at DESC')
  end

  def show
    @post_attachments = @post.post_attachments.all
  end

  def new
    @post = Post.new
    @post_attachment = @post.post_attachments.build
  end

  def create
    @post = Post.new(post_params)

    respond_to do |format|
       if @post.save
         params[:post_attachments]['attachments'].each do |a|
            @post_attachment = @post.post_attachments.create!(:attachments => a)
         end
         format.html { redirect_to @post, notice: 'Post was successfully created.' }
       else
         format.html { render action: 'new' }
       end
     end
   end

  def edit
  end

  def update
    if @post.update_attributes(post_params)
      redirect_to post_path(@post)
    else
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    flash[:sucess] = "The post was destroyed."
    redirect_to root_path
  end

  private

  def post_params
    params.require(:post).permit(:title, :body, :image,
      :remove_image, post_attachments_attributes: [:id, :post_id, :attachments])
  end

  def set_post
    @post = Post.find(params[:id])
  end
end
