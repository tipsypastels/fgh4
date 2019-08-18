# == Schema Information
#
# Table name: recordings
#
#  id            :integer          not null, primary key
#  color         :string
#  discord       :string
#  github        :string
#  name          :string
#  pokecomm      :string
#  published_at  :datetime
#  relic_castle  :string
#  replies_count :integer          default(0)
#  slug          :string
#  type          :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  user_id       :integer
#
# Indexes
#
#  index_recordings_on_slug  (slug) UNIQUE
#

class Tutorial < Recording
  def self.sti_style
    { icon: :'graduation-cap', color: 'orange-500' }
  end

  def default_content_items
    {
      introduction: :text,
      description:  :text,
      examples:     :text,
      images:       :gallery,
    }
  end
end
