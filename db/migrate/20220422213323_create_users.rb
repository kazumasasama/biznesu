class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :password
      t.string :email
      t.string :phone
      t.string :gender
      t.string :zip
      t.string :state
      t.string :city
      t.text :address
      t.text :note
      t.date :birthday
      t.string :status

      t.timestamps
    end
  end
end
