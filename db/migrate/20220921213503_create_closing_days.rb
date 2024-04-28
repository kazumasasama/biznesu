class CreateClosingDays < ActiveRecord::Migration[7.0]
  def change
    create_table :closing_days do |t|
      t.date :date
      t.integer :business_id
      t.timestamps
    end
  end
end
