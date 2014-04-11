class CreateEncounters < ActiveRecord::Migration
  def change
    create_table :encounters do |t|
      t.text :notes
      t.integer :procedure_id, null: false
      t.integer :patient_id, null: false
      t.integer :user_id, null: false
    end
    add_index :encounters, :procedure_id
    add_index :encounters, :patient_id
    add_index :encounters, :user_id
  end
end
