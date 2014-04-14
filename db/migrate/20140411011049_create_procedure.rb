class CreateProcedure < ActiveRecord::Migration
  def change
    create_table :procedures do |t|
      t.string :code, null: false
      t.string :description, null: false
      t.integer :work_rvu, null: false
      t.string :patient_name, null: false
      t.string :insurance_provider
    end
  end
end
