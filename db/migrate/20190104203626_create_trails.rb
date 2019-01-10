class CreateTrails < ActiveRecord::Migration[5.2]
  def change
    create_table :trails do |t|
      t.integer :trail_number

      t.timestamps
    end
  end
end
