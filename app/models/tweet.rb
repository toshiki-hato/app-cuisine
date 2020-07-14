class Tweet < ApplicationRecord
  # belongs_to :user
  validates :text, presence: true
  belongs_to :user
end
