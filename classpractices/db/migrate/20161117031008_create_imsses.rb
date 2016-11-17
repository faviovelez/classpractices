class CreateImsses < ActiveRecord::Migration
  def change
    create_table :imsses do |t|
      t.string :nombre
      t.string :curp
      t.string :direccion
      t.integer :edad
      t.string :telefono
      t.integer :no_imss

      t.timestamps null: false
    end
  end
end
