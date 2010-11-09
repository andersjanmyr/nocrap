# Read about factories at http://github.com/thoughtbot/factory_girl

Factory.define :user do |f|
  f.twitter_uid "MyString"
  f.nickname "MyString"
end