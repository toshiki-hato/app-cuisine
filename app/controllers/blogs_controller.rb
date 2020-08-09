class BlogsController < ApplicationController

  def index
    @blogs = Blog.all
    @tweets = Tweet.all
  end
  def new
    @blog = Blog.new
    @tweet = Tweet.find(params[:id])
  end

  def show
    @blog = Blog.find(params[:id])
  end

  def create
    @blog = current_user.blogs.new(blog_parameter)
    @blog.save
      redirect_to blogs_path
  end

  def destroy
    @blog = Blog.find(params[:id])
    @blog.destroy
    redirect_to blogs_path, notice:"削除しました"
  end

  def edit
    @blog = Blog.find(params[:id])
  end

  def update
    @blog = Blog.find(params[:id])
    if @blog.update(blog_parameter)
      redirect_to blogs_path, notice: "編集しました"
    else
      render 'edit'
    end
  end

  private

  def blog_parameter
    params.require(:blog).permit(:title, :content, :start_time, :user_id, :tweet_id)
  end

end