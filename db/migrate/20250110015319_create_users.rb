class CreateUsers < ActiveRecord::Migration[8.0]
  def change
    create_table :users do |t|
      t.string :name, null: true
      t.date :birth_date, null: true
      t.string :gender, null: true
      t.integer :status, default: 0, null: false

      t.timestamps
    end
  end
end
