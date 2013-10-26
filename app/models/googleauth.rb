class Googleauth < ActiveRecord::Base
  attr_accessible :user_id, :provider, :uid
end
