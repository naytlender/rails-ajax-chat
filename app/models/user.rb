class User < ApplicationRecord

  mount_uploader :avatar, AvatarUploader
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  # :recoverable, :rememberable, :trackable, :validatable
  devise :database_authenticatable, :registerable

  has_many :chat_rooms, dependent: :destroy
  has_many :messages, dependent: :destroy
end
