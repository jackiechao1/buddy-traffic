class Buddy < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  mount_uploader :picture, PictureUploader
  validates :name, presence: true
  validates :age, presence: true
  validates :sex, presence: true
  validates :description, presence: true
  validates :location, presence: true
  validates :start_available_time, presence: true
  validates :end_available_time, presence: true
end
