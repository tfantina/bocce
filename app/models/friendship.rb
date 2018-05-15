class Friendship < ApplicationRecord
  belongs_to :user_id, class_name: "User"
  validates :user_id, :user2_id, :requested, presence: true
end
