module Recording::Taggable
  extend ActiveSupport::Concern

  included do
    has_many :taggings, dependent: :destroy
    has_many :tags, through: :taggings
  end

  def tag_list
    tags.collect(&:name).join(', ')
  end

  def tag_list=(tag_list)
    self.tags = tag_list.split(/,/).map do |name|
      name = name.strip.delete('#')
      Tag.find_or_create_by(name: name)
    end
  end
end