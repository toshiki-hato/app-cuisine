class TweetsController < ApplicationController
  before_action :move_to_index, except: [:index, :show]
  def index
    @tweets = Tweet.all
  end

  def new
    @tweet = Tweet.new
  end

  def create
    Tweet.create(tweet_params)
  end


  private
  def tweet_params
    params.require(:tweet).permit(:title, :text, :image)
  end
  
  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end

end
