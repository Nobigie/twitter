class Relationship < ActiveRecord::Base
  belongs_to :followers, class_name: "User"
  belongs_to :followed, class_name: "User"

  validates :followers_id, presence: true
  validates :followed_id, presence: true
end
