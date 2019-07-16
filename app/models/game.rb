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
