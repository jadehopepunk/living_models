class AddDefaultCategories < ActiveRecord::Migration
  def self.up
    values = [
      {:name => "Dialogue", :description => "community development, psychology, conflict resolution, networking"},
      {:name => "Economics", :description => "local economies, ethical investment, peer to peer banking"},
      {:name => "Education", :description => "workshops, awareness raising"},
      {:name => "Energy", :description => "micro generation, cooperatives, alternatives, conservation"},
      {:name => "Food ", :description => "local, urban, rural"},
      {:name => "Governance", :description => "local democracy, local and central govt"},
      {:name => "Health", :description => "local solutions, natural health and well-being"},
      {:name => "Housing", :description => "local solutions, natural materials, efficiency by design"},
      {:name => "Information", :description => "websites, radio, tv, publications"},
      {:name => "Regeneration", :description => "conservation, ecological restoration"},
      {:name => "Resources", :description => "resource recovery, substitution, fibres"},
      {:name => "Transport", :description => "technology, cooperatives, reduction of"}
    ]

    values.each do |attributes|
      Category.create(attributes)
    end
  end

  def self.down
    Category.delete_all
  end
end
