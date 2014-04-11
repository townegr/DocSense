class ChangeWorkRvuDataType < ActiveRecord::Migration
  def up
    change_column :procedures, :work_rvu, :decimal, precision: 5, scale: 2
  end

  def down
    change_column :procedures, :work_rvu, :integer
  end
end
