class Buddy < ApplicationRecord
  belongs_to :user
  has_many :reviews, dependent: :destroy
  has_many :bookings, dependent: :destroy
  mount_uploader :picture, PictureUploader
  validates :name, presence: true
  validates :description, presence: true
  validates :location, presence: true
  validates :start_available_time, presence: true
  validates :end_available_time, presence: true

  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?
end
