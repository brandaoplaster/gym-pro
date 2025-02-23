class CreateWorkoutSession < ActiveRecord::Migration[8.0]
  def change
    create_table :workout_sessions do |t|
      t.references :workout, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.datetime :started_at, null: false
      t.datetime :finished_at

      t.timestamps
    end
  end
end
