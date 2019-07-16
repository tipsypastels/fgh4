# == Schema Information
#
# Table name: reactions
#
#  id             :integer          not null, primary key
#  reactable_type :string
#  reactable_id   :integer
#  emoji          :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  user_id        :integer
#

class Reaction < ApplicationRecord
  belongs_to :reactable, polymorphic: true
  belongs_to :user

  enum emoji: {
    thumbsup: 0,
    heart:    1,
    joy:      2,
    angery:   3,
    zig:      4,
    wobb:     5,
    pory:     6,
    lala:     7,
  }

  def self.for(reactable, user)
    find_by(reactable: reactable, user: user)
  end
end
