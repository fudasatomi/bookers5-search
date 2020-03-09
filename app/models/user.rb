class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable,:validatable

  has_many :books, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :book_comments, dependent: :destroy
  attachment :profile_image, destroy: false

  has_many :follower, foreign_key: "follower_id",
                      class_name: "Relationship",
                      dependent: :destroy

  has_many :following_user, through: :follower, source: :following

  has_many :following, foreign_key: "following_id",
                       class_name: "Relationship",
                       dependent: :destroy

  has_many :follower_user, through: :following, source: :follower

  def following?(user)
    following_user.include?(user)
  end

  def follow(user_id)
    follower.create(following_id: user_id)
  end

  def unfollow(user_id)
    follower.find_by(following_id: user_id).destroy
  end
  #バリデーションは該当するモデルに設定する。エラーにする条件を設定できる。
  validates :name, length: {maximum: 20, minimum: 2}
  validates :introduction, length:{maximum: 50}
end
