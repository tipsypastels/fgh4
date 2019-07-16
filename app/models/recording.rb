# == Schema Information
#
# Table name: recordings
#
#  id           :integer          not null, primary key
#  name         :string
#  user_id      :integer
#  type         :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  slug         :string
#  color        :string
#  github       :string
#  pokecomm     :string
#  discord      :string
#  published_at :datetime
#

class Recording < ApplicationRecord
  include Types

  include Authored, Content, Colorable, Downloadable, IndexListable, Mentionable, Named, Paintable, Publishable, SocialLinkable, Reactable, Taggable

  def term
    type.downcase
  end

  delegate :sti_style, to: :class

  def self.sti_style_of(type)
    type.classify.constantize.sti_style
  end

  def to_partial_path
    'recordings/recording'
  end

  def to_trix_content_attachment_partial_path
    'recordings/recording'
  end
end
