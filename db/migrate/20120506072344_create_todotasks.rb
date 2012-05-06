class CreateTodotasks < ActiveRecord::Migration
  def change
    create_table :todotasks do |t|
      t.string :title
      t.datetime :duedate
      t.text :description
      t.integer :user_id

      t.timestamps
    end
    add_index :todotasks, [:user_id]
  end
end
