class Univ < ActiveRecord::Base

  #association
  has_many :users
  has_many :messages, ->{order("created_at DESC")}
end
