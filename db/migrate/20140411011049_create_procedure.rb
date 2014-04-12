class CreateProcedure < ActiveRecord::Migration
  def change
    create_table :procedures do |t|
      t.string :code, null: false
      t.string :description, null: false
      t.integer :work_rvu, null: false
    end
  end
end
