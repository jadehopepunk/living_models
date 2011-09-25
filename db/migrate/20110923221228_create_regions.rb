class CreateRegions < ActiveRecord::Migration
  def self.up
    create_table :regions do |t|
      t.string :name
      t.timestamps
    end
    execute "INSERT INTO regions (name) VALUES ( 'Northland')";
    execute "INSERT INTO regions (name) VALUES ( 'Auckland')";
    execute "INSERT INTO regions (name) VALUES ( 'Coromandel')";
    execute "INSERT INTO regions (name) VALUES ( 'Bay of Plenty')";
    execute "INSERT INTO regions (name) VALUES ( 'Waikato')";
    execute "INSERT INTO regions (name) VALUES ( 'Eastland')";
    execute "INSERT INTO regions (name) VALUES ( 'Taupo')";
    execute "INSERT INTO regions (name) VALUES ( 'Hawkes Bay')";
    execute "INSERT INTO regions (name) VALUES ( 'Taranaki')";
    execute "INSERT INTO regions (name) VALUES ( 'Manawatu')";
    execute "INSERT INTO regions (name) VALUES ( 'Wairarapa')";
    execute "INSERT INTO regions (name) VALUES ( 'Wellington')";
    execute "INSERT INTO regions (name) VALUES ( 'Nelson Tasman')";
    execute "INSERT INTO regions (name) VALUES ( 'Marlborough')";
    execute "INSERT INTO regions (name) VALUES ( 'Canterbury')";
    execute "INSERT INTO regions (name) VALUES ( 'West Coast')";
    execute "INSERT INTO regions (name) VALUES ( 'Otago')";
    execute "INSERT INTO regions (name) VALUES ( 'Southland')";
    execute "INSERT INTO regions (name) VALUES ( 'Stewart Island')";
  end

  def self.down
    drop_table :regions
  end
end
