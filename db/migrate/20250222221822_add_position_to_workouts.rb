class AddPositionToWorkouts < ActiveRecord::Migration[8.0]
  def change
    add_column :workouts, :position, :integer, default: 0, null: false
    add_index :workouts, :position
  end
end
