class AddReferenceToWorkInVote < ActiveRecord::Migration[6.0]
  def change
    add_reference :votes, :work, foreign_key: true, index: true
  end
end
