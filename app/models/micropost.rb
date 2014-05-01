class Micropost < ActiveRecord::Base
  belongs_to :user

  default_scope -> { order('created_at DESC') } #Standard syntax for this kind of object, called a Proc; DESC is SQL for “descending”
  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 140 }
end
