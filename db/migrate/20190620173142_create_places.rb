class CreatePlaces < ActiveRecord::Migration[5.2]
  def change
    create_table :places do |t|
      t.integer :user_id
      t.float :lat
      t.float :lng

      t.timestamps
    end
  end
end
