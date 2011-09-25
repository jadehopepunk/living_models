class CreateProjects < ActiveRecord::Migration
  def self.up
    create_table :projects do |t|
      t.string :location, :category, :tags
      t.text :summary, :goals, :outcomes, :future_plans
      t.string :website
      t.string :contact_email_address, :contact_name, :contact_phone      
      
      t.timestamps
    end
  end

  def self.down
    drop_table :projects
  end
end
