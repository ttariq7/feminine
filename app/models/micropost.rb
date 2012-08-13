class Micropost < ActiveRecord::Base
  attr_accessible :content, :image
  belongs_to :user
  has_many :comments, dependent: :destroy 
  accepts_nested_attributes_for :comments

  mount_uploader :image, ImageUploader
  
  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 140 }

  default_scope order: 'microposts.created_at DESC'

  def self.from_users_followed_by(user)
    followed_user_ids = "SELECT followed_id FROM relationships
                         WHERE follower_id = :user_id"
    where("user_id IN (#{followed_user_ids}) OR user_id = :user_id", 
          user_id: user.id)
  end
end