class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  attr_accessible :username

  validates :username, presence: true, uniqueness: true

  has_many :friendships
  has_many :friends, :through => :friendships

  has_many :inverse_friendships, :class_name => "Friendship", :foreign_key => "friend_id"  
  has_many :inverse_friends, :through => :inverse_friendships, :source => :user

  has_many :posts

  def timeline(page)
    Post.includes(:user).where(user_id: Friendship.where(user_id: self.id).pluck(:friend_id) << self.id).order("created_at desc").paginate(:page => page, :per_page => 50)
  end

  def self.search(param)
    where("username like :busca or email like :busca", busca: "%#{param}%")
  end
end
