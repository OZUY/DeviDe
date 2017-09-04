class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|

      t.integer :user_id
      t.text :text
      t.integer :univ_id

      t.timestamps null: false
    end
  end
end
