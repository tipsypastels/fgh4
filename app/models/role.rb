# == Schema Information
#
# Table name: roles
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#

class Role < ApplicationRecord
  include Comparable

  ROLES = {
    tech_admin: {
      color: 'orange-500',
      title: 'Tech Admin',
    },

    admin: {
      color: 'green-600',
      title: 'Admin',
    },

    comfer: {
      color: 'blue-600',
      title: 'Comfer',
    },
  }.with_indifferent_access
  ROLE_NAMES = ROLES.keys

  validates :name,
    inclusion: {
      in: ROLE_NAMES,
    }

  def title
    ROLES[name][:title]
  end

  def color
    ROLES[name][:color]
  end

  def <=>(other)
    index <=> other.index
  end

  def index
    ROLE_NAMES.index(name)
  end
end
