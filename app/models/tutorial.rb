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
