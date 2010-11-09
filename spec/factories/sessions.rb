# Read about factories at http://github.com/thoughtbot/factory_girl

Factory.define :session do |f|
  f.user_id 1
  f.oauth_token "MyString"
  f.oauth_secret "MyString"
end