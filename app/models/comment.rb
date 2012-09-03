class Comment < ActiveRecord::Base
    attr_accessible :body

    belongs_to :user
    belongs_to :micropost

    validates :body, presence: true, length: { maximum: 400 }
    validates :user_id, presence: true
    validates :micropost_id, presence: true


    default_scope order: 'comments.created_at DESC'
  end
