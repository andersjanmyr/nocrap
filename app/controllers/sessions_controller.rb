class SessionsController < ApplicationController
  def create
    omniauth = request.env['omniauth.auth']
    p omniauth["uid"]
    p omniauth["user_info"]
    a_token = omniauth['credentials']['token']
    a_secret = omniauth['credentials']['secret']
    consumer_key = ENV['NOCRAP_TWITTER_CONSUMER_KEY']
    consumer_secret = ENV['NOCRAP_TWITTER_CONSUMER_SECRET']
    oauth = Twitter::OAuth.new(consumer_key, consumer_secret)
    oauth.authorize_from_access(a_token, a_secret)
    client = Twitter::Base.new(oauth)

    render :text => omniauth.inspect
  end
end

