class AddAttributesToUser < ActiveRecord::Migration
  def change
    add_column :users, :first_name, :string, null: false
    add_column :users, :last_name, :string, null: false
    add_column :users, :job_title, :string, null: false, default: 'Medical Provider'
    add_column :users, :dollar_per_rvu, :integer, null: false
  end
end
