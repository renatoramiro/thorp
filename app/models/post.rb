class Post < ActiveRecord::Base
  attr_accessible :body, :reply_to_id, :user_id

  belongs_to :user

  has_many :replies, :class_name => "Post", :foreign_key => "reply_to_id"

  validates :body, length: { maximum: 141 }
end
