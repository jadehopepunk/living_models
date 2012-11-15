module LivingModelsTagExtensions
  def self.included(base)
    base.named_scope :published, {
      :conditions => ["projects.published = TRUE"]
    }
  end
end

ActsAsTaggableOn::Tag.send(:include, LivingModelsTagExtensions)
