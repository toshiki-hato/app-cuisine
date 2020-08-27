class LikesController < ApplicationController
  before_action :set_tweet, only: [:create, :destroy]

  def create
    @like = current_user.likes.create(tweet_id: params[:tweet_id])
    @tweets = Tweet.all
  end

  def destroy
    like = current_user.likes.find_by(tweet_id: params[:tweet_id])
    like.destroy
    @tweets = Tweet.all
  end

  private

  def set_tweet
    @tweet = Tweet.find(params[:tweet_id])
  end
end
