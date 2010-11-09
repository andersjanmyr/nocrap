class SessionsController < ApplicationController
  def create
    omniauth = request.env['omniauth.auth']
    user_info = omniauth["user_info"]
    user = User.find_by_twitter_uid(omniauth["uid"])
    if user
      user.update_attributes(:nickname => user_info["nickname"])
    else
      user = User.create(:twitter_uid => omniauth["uid"],
        :nickname => user_info["nickname"])
    end
    session = Session.create(:user_id => user.id,
      :oauth_token => omniauth['credentials']['token'],
      :oauth_secret => omniauth['credentials']['secret'])
    consumer_key = ENV['NOCRAP_TWITTER_CONSUMER_KEY']
    consumer_secret = ENV['NOCRAP_TWITTER_CONSUMER_SECRET']
    oauth = Twitter::OAuth.new(consumer_key, consumer_secret)
    oauth.authorize_from_access(session.oauth_token, session.oauth_secret)
    client = Twitter::Base.new(oauth)
    puts client.home_timeline.first.text
    render :text => omniauth.inspect
  end
end

