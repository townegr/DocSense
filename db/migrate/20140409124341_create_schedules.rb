class CreateSchedules < ActiveRecord::Migration
  def change
    create_table :schedules do |t|
      t.string :title
      t.date :encounter_date, null: false
      t.integer :commission
      t.integer :procedure_id
      t.integer :patient_id
      t.integer :user_id
    end
  end
end
