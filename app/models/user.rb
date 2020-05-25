class User < ApplicationRecord
  has_many :votes

  validates :username, presence: true, uniqueness: true
  validates :date_joined, presence: true
end
