class CreatePhotos < ActiveRecord::Migration
  def self.up
    create_table :photos do |t|
      t.string :file_file_name, :file_content_type
      t.integer :file_file_size
      t.datetime :file_updated_at
      t.integer :project_id

      t.timestamps
    end
  end

  def self.down
    drop_table :photos
  end
end
