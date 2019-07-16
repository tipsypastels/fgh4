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

require 'test_helper'

class RecordingTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
