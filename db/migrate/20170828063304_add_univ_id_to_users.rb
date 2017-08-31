class AddUnivIdToUsers < ActiveRecord::Migration
  def change
    add_column :users, :univ_id, :integer
  end
end
