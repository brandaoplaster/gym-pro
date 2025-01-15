class CreateUsers < ActiveRecord::Migration[8.0]
  def change
    create_table :users do |t|
      t.string :name, null: false
      t.date :birth_date, null: false
      t.string :gender, null: false
      t.integer :status, default: 0, null: false

      t.timestamps
    end
  end
end
