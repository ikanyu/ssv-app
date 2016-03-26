class AddMoreDataToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :identity_number, :string
  	add_column :users, :contact_number, :string
  	add_column :users, :course, :string
  	add_column :users, :course_intake, :date
  	add_column :users, :emergency_contact, :string
  	add_column :users, :emergency_number, :string
  	add_column :users, :expiry, :date
  	add_column :users, :status, :integer, default: 1
    add_column :users, :admin_registration_id, :integer
  end
end
