class CreateHospitals < ActiveRecord::Migration
  def change
    create_table :hospitals do |t|
      t.string :name
      t.string :fed_id
      t.string :address
      t.integer :age
      t.string :phone
      t.integer :social_security_n

      t.timestamps null: false
    end
  end
end
