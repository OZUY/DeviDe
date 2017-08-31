class CreateUnivs < ActiveRecord::Migration
  def change
    create_table :univs do |t|

      t.string :key, unique: true
      t.text :detail

      t.timestamps null: false
    end
  end
end
