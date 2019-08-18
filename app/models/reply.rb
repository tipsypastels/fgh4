# == Schema Information
#
# Table name: replies
#
#  id           :integer          not null, primary key
#  ancestry     :string
#  type         :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  recording_id :integer
#  user_id      :integer
#
# Indexes
#
#  index_replies_on_ancestry  (ancestry)
#

class Reply < ApplicationRecord
  include Ancestry, Authored

  default_scope do
    order(created_at: :desc)
  end

  belongs_to :recording, counter_cache: true, default: -> { parent.recording if ancestors? }
  has_rich_text :content

  validates :content, presence: true
  validates :type, presence: true
end
