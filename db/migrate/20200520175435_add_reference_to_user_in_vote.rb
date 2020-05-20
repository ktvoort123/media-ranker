class AddReferenceToUserInVote < ActiveRecord::Migration[6.0]
  def change
    add_reference :votes, :user, foreign_key: true, index: true
  end
end
