# == Schema Information
#
# Table name: recordings
#
#  id              :integer          not null, primary key
#  banner_has_text :boolean
#  color           :string
#  discord         :string
#  featured_at     :datetime
#  github          :string
#  name            :string
#  pokecomm        :string
#  published_at    :datetime
#  relic_castle    :string
#  replies_count   :integer          default(0)
#  slug            :string
#  type            :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  user_id         :integer
#
# Indexes
#
#  index_recordings_on_slug  (slug) UNIQUE
#

class Recording < ApplicationRecord
  include Types

  include Authored, Content, Colorable, Downloadable, IndexListable, Featurable, Mentionable, Named, Paintable, Publishable, SocialLinkable, Reactable, Replyable, Taggable

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
