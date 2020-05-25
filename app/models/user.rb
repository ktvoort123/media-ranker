class User < ApplicationRecord

  def num_votes
    return self.votes.count
  end

  
  has_many :votes

  validates :username, presence: true, uniqueness: true
  validates :date_joined, presence: true
end
