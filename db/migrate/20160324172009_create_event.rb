class CreateEvent < ActiveRecord::Migration
  def change
    create_table :events do |t|
    	t.string :title
    	t.text :introduction
    	t.date :date
    	t.time :time
    	t.string :venue
    	t.integer :volunteering_hour
    	t.time :gathering_time
    	t.string :gathering_venue
    	t.boolean :transportation
    	t.boolean :meal
    	t.boolean :certificate
    	t.text :job_scope
    	t.text :notes
        t.integer :admin_id
        t.integer :volunteers_needed
        t.integer :max_volunteers

    	t.timestamps
    end
  end
end
