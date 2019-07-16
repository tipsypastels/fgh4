# == Schema Information
#
# Table name: downloads
#
#  id           :integer          not null, primary key
#  recording_id :integer
#  user_id      :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  name         :string
#  uses         :integer          default(0)
#  url          :string
#

class Download < ApplicationRecord
  include Authored

  default_scope { order created_at: :desc }
  
  validates :name, presence: true
  validates :url, presence: true

  belongs_to :recording
end
