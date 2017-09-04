class Message < ActiveRecord::Base

  #association
  belongs_to :user
  belongs_to :univ

  #validation
  validates_presence_of :user_id, :text, :univ_id

end
