class AddJobTitleToUser < ActiveRecord::Migration
  def change
    add_column :users, :job_title, :string, null: false, default: 'Medical Provider'
  end
end
