class Message < ApplicationRecord
  belongs_to :user
  belongs_to :channel
  validates :content, presence: true
  validates :content, length: { maximum: 10_000 }
end
