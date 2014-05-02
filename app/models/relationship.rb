class Relationship < ActiveRecord::Base
  belongs_to :followers, class_name: "User" #On flag 2 types de followers
  belongs_to :followed, class_name: "User" #On flag 2 types de followers

  validates :followers_id, presence: true
  validates :followed_id, presence: true
end
