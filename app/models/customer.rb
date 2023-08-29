class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  has_many :impressions, dependent: :destroy
  has_many :comments, dependent: :destroy
  
  has_many :reverse_of_relationships, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy
  has_many :followers, through: :reverse_of_relationships, source: :follower
  
  has_many :relationships, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
  has_many :followings, through: :relationships, source: :followed
  
  def follow(customer)
    relationships.create(followed_id: customer.id)
  end
  
  def unfollow(customer)
    relationships.find_by(followed_id: customer.id).destroy
  end
  
  def following?(customer)
    followings.include?(customer)
  end
  
  def active_for_authentication?
    super && (is_deleted == true)
  end
  
  
  def self.search_for(content, method)
    if method == "perfect"
      Customer.where(user_name: content)
    elsif method == "forward"
      Customer.where("user_name LIKE?",content+'%')
    elsif method == "backward"
      Customer.where("user_name LIKE?",'%'+content)
    elsif method == "partial"
      Customer.where("user_name LIKE?",'%'+content+'%')
    end
  end
end
