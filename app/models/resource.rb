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

class Resource < Recording
  def self.sti_style
    { icon: :download, color: 'pink-600' }
  end

  def default_content_items
    {
      description: :text,
      links:       :text,
    }
  end
end
