class Work < ApplicationRecord

  def num_votes
    return self.votes.count
  end

  has_many :votes

  validates :category, presence: true
  validates :title, presence: true, uniqueness: {scope: :category}
  
end
