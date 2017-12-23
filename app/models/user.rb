class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :name, presence: true
  has_many :posts, dependent: :destroy

  def search_all
    users = User.where(["name LIKE ?", "%#{keywords}%"])
  end


end
