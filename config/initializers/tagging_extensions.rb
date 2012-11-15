module LivingModelsTagExtensions
  def self.included(base)
    base.scope :published, {
      :conditions => ["projects.published = TRUE"]
    }
  end
end

ActsAsTaggableOn::Tag.send(:include, LivingModelsTagExtensions)
