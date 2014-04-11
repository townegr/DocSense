class CreatePatient < ActiveRecord::Migration
  def change
    create_table :patients do |t|
      t.string :name, null: false
      t.string :insurance_provider
      t.date :date_of_birth
      t.string :primary_md
    end
  end
end
