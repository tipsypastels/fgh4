# == Schema Information
#
# Table name: recordings
#
#  id           :integer          not null, primary key
#  color        :string
#  discord      :string
#  github       :string
#  name         :string
#  pokecomm     :string
#  published_at :datetime
#  slug         :string
#  type         :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  user_id      :integer
#
# Indexes
#
#  index_recordings_on_slug  (slug) UNIQUE
#

class Game < Recording
  def self.sti_style
    { icon: :gamepad, color: 'green-600' }
  end

  def default_content_items
    {
      introduction: :text,
      story:        :text,
      screenshots:  :gallery,
    }
  end
end
