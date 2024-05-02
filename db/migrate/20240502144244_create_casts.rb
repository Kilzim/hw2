class CreateCasts < ActiveRecord::Migration[7.1]
  def change
    create_table :casts do |t|
      t.string "movie"
      t.string "actor"
      t.string "role"
      t.timestamps
    end
  end
end
