module LivingModelsTagExtensions
  def self.included(base)
    base.named_scope :published, {
      :conditions => ["projects.published = TRUE"]
    }
  end
end

Tag.send(:include, LivingModelsTagExtensions)
