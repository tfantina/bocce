class Friendship < ApplicationRecord
<<<<<<< HEAD
  belongs_to :user_id, class_name: "User"
  validates :user_id, :user2_id, :requested, presence: true
=======
  after_create :create_inverse_relationship
  belongs_to :user
  belongs_to :friend, class_name: 'User'

  private

  def create_inverse_relationship
    friend.friendships.create(friend: user), unless already_friended?
  end

  def already_friended?
    friend.friends.include?(user)
  end
>>>>>>> Design
end
