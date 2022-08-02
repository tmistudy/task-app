class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :title
      t.date :start
      t.date :end
      t.integer :all_day

      t.timestamps
    end
  end
end
