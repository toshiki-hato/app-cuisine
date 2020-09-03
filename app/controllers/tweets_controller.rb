class TweetsController < ApplicationController
  before_action :set_tweet, only: [:edit, :show]
  before_action :move_to_index, except: [:index, :show, :search, :new]

  def index
    @tweets = Tweet.includes(:user)ORDER BY random().limit(9)
    @all_ranks = Tweet.find(Like.group(:tweet_id).order('count(tweet_id) desc').limit(3).pluck(:tweet_id))
  end

  def new
    @tweet = Tweet.new
    # flash.now[:alert] = '記事を投稿をしてください。'
  end

  def create
    Tweet.create(tweet_params)
    redirect_to root_url, notice: '投稿が完了しました。'
  end

  def destroy
    tweet = Tweet.find(params[:id])
    redirect_to root_url, notice: '削除が完了しました。'
    tweet.destroy
  end

  def edit
  end

  def update
    tweet = Tweet.find(params[:id])
    tweet.update(tweet_params)
    redirect_to root_url, notice: '編集が完了しました。'
  end

  def show
    @comment = Comment.new
    @comments = @tweet.comments.includes(:user)
  end

  def search
    @tweets = Tweet.search(params[:keyword])
  end

  private
  def tweet_params
    params.require(:tweet).permit( :title, :text, :image, :image_cache).merge(user_id: current_user.id)
  end
  
  def set_tweet
    @tweet = Tweet.find(params[:id])
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end

end
