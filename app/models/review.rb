class Review < ApplicationRecord
  belongs_to :buddy
  validates :content, presence: true, length: { minimum: 20 }
end
