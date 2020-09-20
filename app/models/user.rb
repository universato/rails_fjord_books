# frozen_string_literal: true

class User < ApplicationRecord
  has_many :active_user_relations, class_name: "UserRelation", foreign_key: "follower_id", dependent: :destroy
  has_many :passive_user_relations, class_name: "UserRelation", foreign_key: "followed_id", dependent: :destroy
  has_many :following, through: :active_user_relations, source: :followed
  has_many :followers, through: :passive_user_relations, source: :follower


  def follow(other_user)
    following << other_user
  end

  def unfollow(other_user)
    active_user_relations.find_by(followed_id: other_user.id).destroy
  end

  def following?(other_user)
    following.include?(other_user)
  end

  has_one_attached :icon


  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email    = auth.info.email
      user.password = Devise.friendly_token[0, 20]
      # user.name     = auth.info.name   # assuming the user model has a name
      # user.icon    = auth.info.image # assuming the user model has an image
      # If you are using confirmable and the provider(s) you use validate emails,
      # uncomment the line below to skip the confirmation emails.
      # user.skip_confirmation!
    end
  end
end
