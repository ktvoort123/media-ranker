class Work < ApplicationRecord

  def num_votes
    return self.votes.count
  end

  def self.work_with_most_votes
    return self.all.sort_by{|work| work.num_votes}.reverse[0]
  end

  def self.top_ten(category)
    return self.where(category: category).sort_by{|work| work.num_votes}.reverse[0...10]
  end


  has_many :votes

  validates :category, presence: true
  validates :title, presence: true, uniqueness: {scope: :category}
  
end
