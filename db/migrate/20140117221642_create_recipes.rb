class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
      t.string :title
      t.text :notes
      t.string :instructions
      t.string :estimated_time

      t.timestamps
    end
  end
end
