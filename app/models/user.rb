class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  mount_uploader :profile_photo, ProfilePhotoUploader
  devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :validatable
end
