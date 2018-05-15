class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :name, presence: true
  
  has_many :posts, dependent: :destroy
  has_many :friends, dependent: :destroy

  has_attached_file :profile_pic, styles: {xl: "1000>1000x", lg: "600x600>", med: "300x300>", thumb: "60x60>"}
  validates_attachment_content_type :profile_pic, content_type: /\Aimage\/.*\z/

  #has_many :current_friendships, class_name: "Friendship",
  #                               foreign_key: "user_id",
  #                               dependent: :destroy
  #has_many :friends, through: :current_friendships, source: :friend


  def search_all
    users = User.where(["name LIKE ?", "%#{keywords}%"])
  end


end
