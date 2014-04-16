class CreateEncounters < ActiveRecord::Migration
  def change
    create_table :encounters do |t|
      t.string :patient_name, null: false
      t.string :insurance_provider, null: false
      t.text :notes
      t.integer :procedure_id, null: false
      t.integer :user_id, null: false
      t.float :physician_fee

      t.timestamps
    end
    add_index :encounters, :procedure_id
    add_index :encounters, :user_id
  end
end
